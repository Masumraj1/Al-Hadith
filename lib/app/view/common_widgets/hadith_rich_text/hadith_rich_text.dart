import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadithRichText extends StatelessWidget {
  final String chapterLabel;
  final String chapterTitle;
  final String description;

  const HadithRichText({
    super.key,
    required this.chapterLabel,
    required this.chapterTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style:  TextStyle(
          color: Colors.black87,
          fontSize: 14.sp,
        ),
        children: [
          TextSpan(
            text: chapterLabel,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '$chapterTitle\n\n',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: description,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
