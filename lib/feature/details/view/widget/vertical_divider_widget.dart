
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: VerticalDivider(thickness: 2, color: AppColors.grayColor),
    );
  }
}