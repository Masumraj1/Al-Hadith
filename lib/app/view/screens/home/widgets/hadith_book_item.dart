import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:al_hadith/app/core/constants/app_strings.dart';
import 'package:al_hadith/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadithBookItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final String iconText;
  final Color iconColor;

  const HadithBookItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.iconText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Card(
        color: AppColors.white,
        margin: EdgeInsets.only(bottom: 12.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: iconColor,
            child: CustomText(text: iconText, color: AppColors.white),
          ),
          title: CustomText(
            textAlign: TextAlign.start,
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.black7,
          ),
          subtitle: Text(subtitle),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text: count,
                fontWeight: FontWeight.bold,
                color: AppColors.black7,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: AppStrings.hadith,
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
