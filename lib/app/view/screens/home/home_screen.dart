import 'dart:async';

import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:al_hadith/app/core/constants/app_strings.dart';
import 'package:al_hadith/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:al_hadith/app/view/screens/home/controller/home_controller.dart';
import 'package:al_hadith/app/view/screens/home/widgets/hadith_book_item.dart';
import 'package:al_hadith/app/view/screens/home/widgets/short_cut_item.dart';
import 'package:al_hadith/app/view/screens/home/widgets/top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/routes/route_path.dart';
import '../../../core/routes/routes.dart';
import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final HomeController homeController = Get.find<HomeController>();



  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        homeController.currentIndex = (homeController.currentIndex + 1) % homeController.hadithList.length;
        _pageController.animateToPage(
          homeController.currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // =========Top  Section==========
          TopSection(pageController: _pageController, homeController: homeController),

          // ===============Shortcuts Section============
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ShortcutItem(icon: Icons.history, label: AppStrings.sorboses),
                ShortcutItem(icon: Icons.menu_book, label: AppStrings.aps),
                ShortcutItem(icon: Icons.send, label: AppStrings.hadiseJan),
                ShortcutItem(icon: Icons.favorite, label: AppStrings.sodaka),
              ],
            ),
          ),

          // ==========>>>>>All Hadith Books Header<<<<==========
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: AppStrings.sobHadith,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.black7,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ==============List of Books==============
          Expanded(
            child: Obx(() {
              if (homeController.hadithBooks.isEmpty) {
                return Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              return ListView.builder(
                itemCount: homeController.hadithBooks.length,
                itemBuilder: (context, index) {
                  final book = homeController.hadithBooks[index];
                  return GestureDetector(
                    onTap: () async {
                      final subTitle = '${book.count} টি হাদীস';
                      final items = await homeController.getTopicsByBookId(book.id);
                      AppRouter.route.pushNamed(
                        RoutePath.searchHadith,
                        extra: {
                          'title': book.title,
                          'subTitle': subTitle,
                          'items': items.map((e) => e.title).toList(),
                        },
                      );
                    },
                    child: HadithBookItem(
                      title: book.title,
                      subtitle: book.subtitle,
                      count: book.count,
                      iconText: book.iconText,
                      iconColor: homeController.colorFromHex(book.iconColor),
                    ),
                  );
                },
              );
            }),
          ),




        ],
      ),
    );
  }
}

