
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.text, required this.iconPath});
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: AppColors.grayColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
