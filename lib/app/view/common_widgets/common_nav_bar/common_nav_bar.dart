import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/routes/route_path.dart';
import '../../../core/routes/routes.dart';
import '../custom_text/custom_text.dart';

class CommonNavBar extends StatefulWidget {
  final int currentIndex;

  const CommonNavBar({required this.currentIndex, super.key});

  @override
  State<CommonNavBar> createState() => _CommonNavBarState();
}

class _CommonNavBarState extends State<CommonNavBar> {
  late int bottomNavIndex;

  final List<
      ({
        String route,
        Widget selectedIcon,
        Widget unselectedIcon,
        String label
      })> _navItems = [
    (
      route: RoutePath.homeScreen,
      selectedIcon: Icon(
        Icons.home,
        color: const Color(0xFF00996E),
      ),
      unselectedIcon: Icon(
        Icons.home,
        color: Colors.grey,
      ),
      label: "",
    ),
    (
      route: RoutePath.chaptersScreen,
    selectedIcon: Icon(Icons.bookmark,color: const Color(0xFF00996E),),
    unselectedIcon:Icon(Icons.bookmark,color: Colors.grey,),
      label: "",
    ),
    (
      route: RoutePath.homeScreen,
    selectedIcon: Icon(Icons.g_mobiledata,color: const Color(0xFF00996E),),
    unselectedIcon:Icon(Icons.g_mobiledata,color: Colors.grey,),
      label: "",
    ),
    (
      route: RoutePath.hadithDetailsScreen,
    selectedIcon: Icon(Icons.info,color: const Color(0xFF00996E),),
    unselectedIcon:Icon(Icons.info,color: Colors.grey,),
      label: "",
    ),
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 88.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 13.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _navItems.length,
          (index) => InkWell(
            onTap: () => _onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                bottomNavIndex == index
                    ? _navItems[index].selectedIcon
                    : _navItems[index].unselectedIcon,
                SizedBox(height: 4.h),
                CustomText(
                  text: _navItems[index].label.tr,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: bottomNavIndex == index ? Colors.white : Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (widget.currentIndex != index) {
      AppRouter.route.goNamed(_navItems[index].route);
    }
  }
}
