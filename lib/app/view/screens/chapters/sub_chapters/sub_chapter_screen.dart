import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../common_widgets/common_appbar/common_appbar.dart';

class SubChapterScreen extends StatelessWidget {
  const SubChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = GoRouterState.of(context).extra as Map;
    final String title = data['title'];
    final List<String> subItems = List<String>.from(data['items']);

    return Scaffold(
      appBar: CommonAppBar(
        title: title,
        subTitle: "",
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.primary),
          ),
          Positioned(
            top: 0,
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
                      itemCount: subItems.length,
                      itemBuilder: (context, index) {
                        final subTitle = subItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              AppRouter.route.pushNamed(
                                RoutePath.hadithDetailsScreen,
                                extra: {
                                  'title': title,
                                  'subTitle': subTitle,
                                  'isHadith': false,
                                },
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
                                subTitle,
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
