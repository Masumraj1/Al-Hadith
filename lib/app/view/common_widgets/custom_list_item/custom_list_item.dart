import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class CustomListItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? leading;

  const CustomListItem({
    super.key,
    required this.text,
    this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              SizedBox(width: 10.w),
            ],
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16.sp, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
