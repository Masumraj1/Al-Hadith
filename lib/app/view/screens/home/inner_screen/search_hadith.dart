import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../common_widgets/background_container/background_container.dart';
import '../../../common_widgets/common_appbar/common_appbar.dart';
import '../../../common_widgets/custom_list_item/custom_list_item.dart';
import '../../../common_widgets/haxon_widget/haxon_widget.dart';
import '../../../common_widgets/searchInput_field/searchInput_field.dart';


class SearchHadith extends StatelessWidget {
  const SearchHadith({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = GoRouterState.of(context).extra as Map;
    final String title = data['title'];
    final String subTitle = data['subTitle'];
    final List<String> subItems = List<String>.from(data['items']);

    return Scaffold(
      appBar: CommonAppBar(title: title, subTitle: subTitle),
      body: BackgroundContainer(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SearchInputField(hintText: AppStrings.bisoy),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: subItems.length,
                itemBuilder: (context, index) {
                  final item = subItems[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: CustomListItem(
                      leading: HexagonWidget(
                        text: '${index + 1}',
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                        fontSize: 14.sp,
                      ),
                      text: item,
                      onTap: () {
                        AppRouter.route.pushNamed(
                          RoutePath.hadithDetailsScreen,
                          extra: {
                            'title': title,
                            'subTitle': item,
                            'isHadith': true,
                          },
                        );
                      },
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
