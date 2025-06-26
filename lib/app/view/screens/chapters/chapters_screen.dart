import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:al_hadith/app/core/constants/app_strings.dart';
import 'package:al_hadith/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:al_hadith/app/view/screens/chapters/controller/chapter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class ChaptersScreen extends StatelessWidget {
  ChaptersScreen({super.key});

  final ChapterController controller = Get.find<ChapterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 1),
      // backgroundColor: Colors.red,
      body:
      Stack(
        children: [
          // ==============Title Top==============
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: Text(
                AppStrings.bisoyVitik,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Content container with top-left and top-right curve
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration:  BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                ),
              ),
              child: Column(
                children: [
                  //====================Search Field==========
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: CustomTextField(
                      hintText: AppStrings.bisoy,
                      suffixIcon: Icon(Icons.search),
                      fieldBorderColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final item = controller.categories[index];
                        final List<String> titles = item['titles'];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Letter Header
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A8C6D),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  item['letter'] ?? "",
                                  style:  TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),

                              //============ List of Titles =========
                              ...titles.map(
                                (title) => Padding(
                                  padding:  EdgeInsets.only(bottom: 8.h),
                                  child: Row(
                                    children: [
                                       SizedBox(width: 12.w),
                                      Expanded(
                                        child: Container(
                                          padding:  EdgeInsets.all(14.r),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            boxShadow:  [
                                              BoxShadow(
                                                color: AppColors.black12,
                                                blurRadius: 4.r,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            title,
                                            style:  TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
