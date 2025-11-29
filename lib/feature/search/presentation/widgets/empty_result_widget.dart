import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';

class EmptyResultWidget extends StatelessWidget {
  const EmptyResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                AppImages.noResultsImage,
                fit: BoxFit.contain,
                width: 80,
                height: 80,
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'We Are Sorry , We Can Not Find The Movie :(',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              'Find your movie by Type title, categories, years etc',
              style: TextStyle(
                color: AppColors.unselectedItemColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
