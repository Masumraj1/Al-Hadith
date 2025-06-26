import 'package:al_hadith/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:al_hadith/app/view/screens/hadith_details/widgets/show_more_options_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../common_widgets/hadith_rich_text/hadith_rich_text.dart';
import '../../common_widgets/haxon_widget/haxon_widget.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = GoRouterState.of(context).extra as Map;
    final String title = data['title'];        // যেমন: আকিদা
    final String subTitle = data['subTitle'];  // যেমন: আল্লাহ কোথায় আছেন?

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subTitle,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),   Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===============Details Header===========
                    // Container(
                    //   padding: EdgeInsets.all(12.r),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.only(
                    //       topRight: Radius.circular(12.r),
                    //       topLeft: Radius.circular(12.r),
                    //     ),
                    //   ),
                    //   child: HadithRichText(
                    //     chapterLabel: '1/1 Chapter: ',
                    //     chapterTitle: "How the Divine Revelation started being revealed to Allah's Messenger", // এখানে ক্যাটাগরি দেখাবে subtitle হিশেবে
                    //     description:
                    //     'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                    //   ),
                    // ),
                    const SizedBox(height: 16),

                    // ===========Hadith Card================
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row
                          Row(
                            children: [
                              HexagonWidget(
                                text: 'B',
                                backgroundColor: Colors.teal,
                                textColor: Colors.white,
                                fontSize: 14.sp,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      fontSize: 13.sp,
                                      text: "Hadith No: 01",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                    CustomText(
                                      fontSize: 12.sp,
                                      text: "Books Name",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: CustomText(
                                  fontSize: 12.sp,
                                  text: "Sahih",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              GestureDetector(
                                onTap: () {
                                  showMoreOptionsBottomSheet(context);
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.w),

                          // Arabic Hadith
                          CustomText(
                            maxLines: 30,
                            textAlign: TextAlign.right,
                            fontSize: 20.sp,
                            text: "عَنْ أَبِي هُرَيْرَةَ - رضي الله عنه - قَالَ: قَالَ رَسُولُ اللَّهِ - صلى الله عليه وسلم - فِي الْبَحْرِ: «هُوَ الطَّهُورُ مَاؤُهُ الْحِلُّ مَيْتَتُهُ» أَخْرَجَهُ الْأَرْبَعَةُ، وَابْنُ أَبِي شَيْبَةَ وَاللَّفْظُ لَهُ (1)، وَصَحَّحَهُ ابْنُ خُزَيْمَةَ وَالتِّرْمِذِيُّ",
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 16.w),

                          // Narrator
                          CustomText(
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            text: "It is narrated from Abu Hurairah (may Allaah have mercy on him):",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                          SizedBox(height: 8.h),

                          // Translation
                          CustomText(
                            textAlign: TextAlign.start,
                            maxLines: 30,
                            text:
                            "IIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          const SizedBox(height: 16),

                          // Reference
                          CustomText(
                            textAlign: TextAlign.start,
                            maxLines: 10,
                            text:
                            "(See also 51, 2681...) (Modern Publication: 6, Islamic Foundation: 6)",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
