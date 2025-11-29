import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/search/data/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;

  const MovieItem({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.card, width: 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: movie.posterPath != null
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: 60,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.movie_outlined,
                          size: 24,
                          color: AppColors.unselectedItemColor,
                        ),
                      ),
                    )
                  : Container(
                      width: 60,
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.movie_outlined,
                        size: 24,
                        color: AppColors.unselectedItemColor,
                      ),
                    ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildStarRating(),
                      const SizedBox(width: 12),
                      _buildYearChip(),
                      const SizedBox(width: 12),
                      _buildDurationChip(),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.unselectedItemColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: AppColors.ratingColor, size: 16),
      SizedBox(width: 4),
      Text(
        (movie.rating).toStringAsFixed(1),
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );

  Widget _buildYearChip() {
    final year = movie.releaseDate != null && movie.releaseDate!.isNotEmpty
        ? DateTime.parse(movie.releaseDate!).year
        : 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        year == 0 ? 'N/A' : '$year',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDurationChip() => Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time, color: AppColors.unselectedItemColor, size: 14),
        SizedBox(width: 2),
        Text(
          '120 min',
          style: TextStyle(
            color: AppColors.unselectedItemColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
