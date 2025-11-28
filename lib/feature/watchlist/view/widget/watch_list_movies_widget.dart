import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/models/movie_model.dart';

class WatchListMoviesWidget extends StatelessWidget {
  const WatchListMoviesWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    height: 140,
                    width: 115,
                    fit: BoxFit.cover, imageUrl: movie.fullImageUrl,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title??"",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 14),
                    WatchListMovieDetailRow(
                      image: AppImages.starIcon,
                      color: AppColors.ratingColor,
                      text:movie.voteAverage.toString(),
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.ticketIcon,
                      text: movie.popularity.toString(),
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.calendarIcon,
                      text: movie.releaseDate??"",
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.clockIcon,
                      text: "1h 30m",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WatchListMovieDetailRow extends StatelessWidget {
  const WatchListMovieDetailRow({
    super.key,
    required this.image,
    required this.text,
    this.color = AppColors.whiteColor,
  });
  final String image;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 6),
        Text(
          "4.5",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: color,
          ),
        ),
      ],
    );
  }
}
