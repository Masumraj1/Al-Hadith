import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../common_widgets/common_appbar/common_appbar.dart';
import '../../../common_widgets/custom_text_field/custom_text_field.dart';
import '../../../common_widgets/haxon_widget/haxon_widget.dart';

class SearchHadith extends StatelessWidget {
  const SearchHadith({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = GoRouterState.of(context).extra as Map;
    final String title = data['title'];
    final String subTitle = data['subTitle'];
    final List<String> subItems = List<String>.from(data['items']);

    return Scaffold(
      appBar: CommonAppBar(
        title: title,
        subTitle: subTitle,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.primary,
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
                  //====================Search Field==========
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: CustomTextField(
                      hintText: AppStrings.bisoy,
                      suffixIcon: Icon(Icons.search),
                      fieldBorderColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: subItems.length,
                      itemBuilder: (context, index) {
                        final item = subItems[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: GestureDetector(
                            onTap: () {
                              AppRouter.route.pushNamed(
                                RoutePath.hadithDetailsScreen,
                                extra: {
                                  'title': title,
                                  'subTitle': item,
                                  "isHadith":true
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
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  HexagonWidget(
                                    text: "${index+1}",
                                    backgroundColor: AppColors.primary,
                                    textColor: AppColors.white,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
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

