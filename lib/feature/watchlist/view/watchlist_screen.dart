import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/watchlist/view/widget/watch_list_movies_widget.dart';
import 'package:movie_app/feature/watchlist/view_model/watchlist_cubit.dart';
import 'package:movie_app/feature/watchlist/view_model/watchlist_state.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
 feature/serach
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Watch list')),
      body: const Center(
        child: Text('Watchlist', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

    return BlocProvider(
      create: (context) => WatchListCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          title: Text(
            'Watchlist',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        body: BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) =>
              state is WatchListEmpty ? _emptyState() : Container(),
        ),
      ),
    );
  }
}

Widget _emptyState() {
  return Column(
    spacing: 12,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(AppImages.noWatchlistImage),
      Text(
        'There is no movie yet!',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
      Text(
        'Find your movie by Type title, categories, years, etc ',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.subTextColor,
        ),
      ),
    ],
  );
}

// Widget _fullState() {
  
//   // return WatchListMoviesWidget(movie: );
// }
 main
