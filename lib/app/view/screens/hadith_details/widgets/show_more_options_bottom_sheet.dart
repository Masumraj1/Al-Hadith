import 'package:al_hadith/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

 void showMoreOptionsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More Option",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
               SizedBox(height: 16.h),

              // Options
              _MoreOptionItem(icon: Icons.send, label: 'Go To Main Hadith',),
              _MoreOptionItem(
                icon: Icons.bookmark_border,
                label: 'Add to Collection',
              ),
              _MoreOptionItem(icon: Icons.copy, label: 'Bangla Copy'),
              _MoreOptionItem(icon: Icons.copy, label: 'English Copy'),
              _MoreOptionItem(icon: Icons.copy, label: 'Arabic Copy'),
              _MoreOptionItem(icon: Icons.add_box_outlined, label: 'Add Hifz'),
              _MoreOptionItem(icon: Icons.note_add_outlined, label: 'Add Note'),
              _MoreOptionItem(icon: Icons.share_outlined, label: 'Share'),
              _MoreOptionItem(icon: Icons.info_outline, label: 'Report'),
               SizedBox(height: 12.h),
            ],
          ),
        ),
      );
    },
  );
}




class _MoreOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MoreOptionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(label, style:  TextStyle(fontSize: 14.sp)),
      onTap: () {
        Navigator.pop(context); // or custom action
      },
    );
  }
}
