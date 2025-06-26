import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/routes/route_path.dart';
import '../../../core/routes/routes.dart';
import '../../common_widgets/common_appbar/common_appbar.dart';
import '../../common_widgets/common_nav_bar/common_nav_bar.dart';
import '../../common_widgets/custom_list_item/custom_list_item.dart';
import '../../common_widgets/searchInput_field/searchInput_field.dart';
import '../../common_widgets/section_header/section_header.dart';
import '../../common_widgets/background_container/background_container.dart';
import 'controller/chapter_controller.dart';

class ChaptersScreen extends StatelessWidget {
  final ChapterController controller = Get.find<ChapterController>();

   ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 1),

      appBar: CommonAppBar(title: AppStrings.bisoyVitik, subTitle: ""),
      body: BackgroundContainer(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SearchInputField(hintText: AppStrings.bisoy),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final item = controller.categories[index];
                  final List<String> titles = item['titles'];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(text: item['letter'] ?? ""),
                        SizedBox(height: 10.h),
                        ...titles.map(
                              (title) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: CustomListItem(
                              text: title,
                              onTap: () {
                                final subItems = controller.getSubItemsForTitle(title);
                                AppRouter.route.pushNamed(
                                  RoutePath.subChapterScreen,
                                  extra: {
                                    'title': title,
                                    'items': subItems,
                                  },
                                );
                              },
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
    );
  }
}
