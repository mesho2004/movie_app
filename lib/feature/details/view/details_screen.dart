import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/details/data/model/details_model.dart';
import 'package:movie_app/feature/details/view/widget/RowWidget.dart';
import 'package:movie_app/feature/details/view/widget/vertical_divider_widget.dart';
import 'package:movie_app/feature/details/view_model/details/details_cubit.dart';
import 'package:movie_app/feature/details/view_model/details/details_state.dart';
import 'package:movie_app/feature/details/view_model/recommended/recommended_cubit.dart';
import 'package:movie_app/feature/details/view_model/recommended/recommended_state.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movieId});
  static const String routeName = 'DetailsScreen';
  final int movieId ;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

final List<DetailsModel> details = [];

class _DetailsScreenState extends State<DetailsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailsCubit()..getMovieDetails( widget.movieId),
        ),
        BlocProvider(
          create: (context) => RecommendedCubit()..getRecommended( widget.movieId),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
            onPressed: () {},
          ),
          title: Text('Details', style: TextStyle(color: AppColors.whiteColor)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset(AppImages.bookmarkIcon),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, detailsState) {
            if (detailsState is DetailsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (detailsState is DetailsError) {
              return Center(child: Text(detailsState.errorMessage));
            }
            if (detailsState is DetailsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:  detailsState.details.fullImageUrl,
                          width: double.infinity,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl:  detailsState.details.fullImageUrl,
                            width: 95,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: 54,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.blurColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.starIcon),
                              SizedBox(width: 5),
                              Text(
                                detailsState.details.voteAverage.toString(),
                                style: TextStyle(
                                  color: AppColors.ratingColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -32,
                        left: 140,
                        child: Text(
                          detailsState.details.title ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RowWidget(
                                iconPath: AppImages.calendarIcon,
                                text: detailsState.details.releaseDate ?? '',
                              ),
                              VerticalDividerWidget(),
                              RowWidget(
                                iconPath: AppImages.clockIcon,
                                text: '${detailsState.details.runtime} min',
                              ),
                              VerticalDividerWidget(),
                              RowWidget(
                                iconPath: AppImages.ticketIcon,
                                text: detailsState.details.status ?? '',
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            detailsState.details.overview ?? '',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Similar",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            child: BlocBuilder<RecommendedCubit, RecommendedState>(
                              builder: (context, recommendedState) {
                                if (recommendedState is RecommendedLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (recommendedState is RecommendedError) {
                                  return Center(
                                    child: Text(recommendedState.errorMessage),
                                  );
                                }
                                if (recommendedState is RecommendedSuccess) {
                                  return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 13,
                                          mainAxisSpacing: 18,
                                        ),
                                    itemCount:
                                        recommendedState
                                            .recommended
                                            .results
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      final movie = recommendedState
                                          .recommended
                                          .results![index];
                                      final imageUrl = movie.posterPath != null
                                          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                                          : '';
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: imageUrl.isNotEmpty
                                            ? Image.network(
                                                imageUrl,
                                                width: 100,
                                                height: 150,
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                width: 100,
                                                height: 150,
                                                color: Colors.grey,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                  ),
                                                ),
                                              ),
                                      );
                                    },
                                  );
                                
                                }
                                return SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
