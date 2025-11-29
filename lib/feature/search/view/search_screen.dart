import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
 feature/serach
import 'package:movie_app/core/network/api/api_service.dart';
import 'package:movie_app/feature/search/data/repository/search_repository.dart';
import 'package:movie_app/feature/search/logic/search_bloc.dart';
import 'package:movie_app/feature/search/logic/search_event.dart';
import 'package:movie_app/feature/search/logic/search_state.dart';
import 'package:movie_app/feature/search/presentation/widgets/empty_result_widget.dart';
import 'package:movie_app/feature/search/presentation/widgets/movie_item.dart';

import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/search/view/widget/search_bar_widget.dart';
import 'package:movie_app/feature/search/view_model/search_cubit.dart';
import 'package:movie_app/feature/search/view_model/search_state.dart';
import 'package:movie_app/feature/watchlist/view/widget/watch_list_movies_widget.dart';
 main

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 feature/serach
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

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(
              controller: controller,
              onChanged: (value) {
                SearchCubit().search(value);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                bloc: SearchCubit(),
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  }

                  if (state is SearchSuccess) {
                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return WatchListMoviesWidget(movie: movie);
                      },
                    );
                  }
                  if (state is SearchEmpty) {
                    return _emptyWidget();
                  }
                  if (state is SearchError) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.noResultsImage, height: 150),
          const SizedBox(height: 20),
          const Text(
            "We Are Sorry, We Can Not Find The Movie :(",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Find your movie by type title, categories, years, etc",
            style: TextStyle(color: Colors.white54, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
 main
