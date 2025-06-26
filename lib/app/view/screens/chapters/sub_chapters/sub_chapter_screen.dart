import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../common_widgets/background_container/background_container.dart';
import '../../../common_widgets/common_appbar/common_appbar.dart';
import '../../../common_widgets/custom_list_item/custom_list_item.dart';


class SubChapterScreen extends StatelessWidget {
  const SubChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = GoRouterState.of(context).extra as Map;
    final String title = data['title'];
    final List<String> subItems = List<String>.from(data['items']);

    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: subItems.length,
            itemBuilder: (context, index) {
              final subTitle = subItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: CustomListItem(
                  text: subTitle,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
