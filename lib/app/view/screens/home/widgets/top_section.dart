import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../common_widgets/custom_text/custom_text.dart';
import '../controller/home_controller.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required PageController pageController,
    required this.homeController,
  }) : _pageController = pageController;

  final PageController _pageController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 60.h,
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.w),
          bottomRight: Radius.circular(24.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // <>>>>>>>>>>>>>AppBar<<<<<<<<<<<<<<>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu, color: AppColors.white),
              CustomText(
                text: AppStrings.alHadith,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              const Icon(Icons.search, color: AppColors.white),
            ],
          ),
          SizedBox(height: 20.h),
          // Quote
          SizedBox(
            height: 100.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: homeController.hadithList.length,
              itemBuilder: (context, index) {
                return CustomText(
                  text: homeController.hadithList[index],
                  fontSize: 14.sp,
                  color: AppColors.white,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),

          SizedBox(height: 10.h),
          CustomText(
            text: AppStrings.sosongthitohadith,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
