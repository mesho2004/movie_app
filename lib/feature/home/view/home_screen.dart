import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/home/data/home_api.dart';
import 'package:movie_app/feature/home/view/widget/top_rated_craousel.dart';
import 'package:movie_app/feature/home/view_model/top_rated_cubit.dart';
import 'package:movie_app/feature/home/view_model/top_rated_state.dart';
import 'package:movie_app/feature/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeApi api = HomeApi();
  late Future<List<Movie>> topRatedFuture;

  @override
  void initState() {
    super.initState();
    topRatedFuture = api.getTopRated();
  }

  @override
  Widget build(BuildContext context) {
 feature/serach
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home')),
      body: const Center(
        child: Text(
          'Home content here',
          style: TextStyle(color: Colors.white70),

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor, // match your screen
        statusBarIconBrightness: Brightness.light, // white icons
      ),
    );

    return BlocProvider(
      create: (_) => TopRatedCubit(HomeApi())..loadTopRated(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    "What do you want to watch?",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<TopRatedCubit, TopRatedState>(
                  builder: (context, state) {
                    if (state is TopRatedLoading) {
                      return const SizedBox(
                        height: 240,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state is TopRatedError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (state is TopRatedSuccess) {
                      return TopRatedCarousel(movies: state.movies);
                    }

                    return const SizedBox.shrink();
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
 main
        ),
      ),
    );
  }
}
