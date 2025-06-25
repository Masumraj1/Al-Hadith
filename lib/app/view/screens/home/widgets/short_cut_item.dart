import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortcutItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ShortcutItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30.h, color: AppColors.primary),
         SizedBox(height: 4.h),
        Text(label, style:  TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}