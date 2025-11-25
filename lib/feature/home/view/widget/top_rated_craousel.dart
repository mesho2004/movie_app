import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/models/movie_model.dart';

class TopRatedCarousel extends StatelessWidget {
  final List<Movie> movies;

  const TopRatedCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final movie = movies[index];

          return SizedBox(
            width: 160,
            height: 240,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.fullImageUrl,
                    height: 240,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: -12,
                  child: Stack(
                    children: [
                      // Stroke text
                      Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = AppColors.blueColor,
                        ),
                      ),

                      // Fill text
                      Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: 10,
      ),
    );
  }
}
