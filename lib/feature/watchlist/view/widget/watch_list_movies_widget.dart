import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';

class WatchListMoviesWidget extends StatelessWidget {
  const WatchListMoviesWidget({super.key});

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
                  child: Image.network(
                    'https://plus.unsplash.com/premium_photo-1664695368767-c42483a0bda1?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dHJhaWxlcnxlbnwwfHwwfHx8MA%3D%3D',
                    height: 140,
                    width: 115,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Movie Title",
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
                      text: "4.5",
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.ticketIcon,
                      text: "4.5",
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.calendarIcon,
                      text: "4.5",
                    ),
                    WatchListMovieDetailRow(
                      image: AppImages.clockIcon,
                      text: "4.5",
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
