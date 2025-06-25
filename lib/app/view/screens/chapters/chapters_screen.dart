import 'package:flutter/material.dart';

import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 1),
    );
  }
}
