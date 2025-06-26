import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:al_hadith/app/view/screens/chapters/controller/chapter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';

class SubChapterScreen extends StatelessWidget {
  SubChapterScreen({super.key});

  final ChapterController controller = Get.find<ChapterController>();

  @override
  Widget build(BuildContext context) {
    // Receive title from previous screen
    final String title = GoRouterState.of(context).extra as String;
    debugPrint("$title");


    return Scaffold(
      body: Stack(
        children: [
          // ==============Title Top==============
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 12.w, right: 12.w),
              child: Text(
                title,
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
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: (){
                              AppRouter.route.pushNamed(
                                RoutePath.hadithDetailsScreen,
                                extra: title,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(14.r),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black12,
                                    blurRadius: 4.r,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                'Item ${index + 1}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
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
