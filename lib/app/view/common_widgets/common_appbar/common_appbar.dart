import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;

  const CommonAppBar({
    super.key,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subTitle != null && subTitle!.isNotEmpty)
            Text(
              subTitle!,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.9),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(subTitle != null && subTitle!.isNotEmpty ? 60.h : 50.h);
}
