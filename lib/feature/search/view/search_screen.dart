import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/network/api/api_service.dart';
import 'package:movie_app/feature/search/data/repository/search_repository.dart';
import 'package:movie_app/feature/search/logic/search_bloc.dart';
import 'package:movie_app/feature/search/logic/search_event.dart';
import 'package:movie_app/feature/search/logic/search_state.dart';
import 'package:movie_app/feature/search/presentation/widgets/empty_result_widget.dart';
import 'package:movie_app/feature/search/presentation/widgets/movie_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SearchBloc(repository: SearchRepository(api: ApiService())),
      child: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _controller.text.trim();
    if (query.isEmpty) {
      context.read<SearchBloc>().add(ClearSearch());
    } else {
      context.read<SearchBloc>().add(SearchMovies(query));
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,

        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.whiteColor),
          onPressed: () {},
        ),
        title: Text(
          'Search',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: AppColors.whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.searchColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.card, width: 1),
            ),
            child: TextField(
              controller: _controller,
              style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                hintStyle: TextStyle(
                  color: AppColors.unselectedItemColor,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.unselectedItemColor,
                  size: 24,
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.unselectedItemColor,
                        ),
                        onPressed: () {
                          _controller.clear();
                          context.read<SearchBloc>().add(ClearSearch());
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Container();
                }

                if (state is SearchLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.ratingColor,
                      strokeWidth: 2,
                    ),
                  );
                }
                if (state is SearchLoaded) {
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.movies.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16),
                    itemBuilder: (_, i) => MovieItem(
                      movie: state.movies[i],
                      onTap: () {
                        print('Movie ID: ${state.movies[i].id}');
                        print('Movie: ${state.movies[i].title}');
                      },
                    ),
                  );
                }

                if (state is SearchEmpty) {
                  return EmptyResultWidget();
                }
                if (state is SearchError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final query = _controller.text.trim();
                            if (query.isNotEmpty) {
                              context.read<SearchBloc>().add(
                                SearchMovies(query),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.ratingColor,
                          ),
                          child: Text(
                            'Retry',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
