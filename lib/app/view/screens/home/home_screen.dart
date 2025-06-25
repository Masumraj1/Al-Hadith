import 'package:flutter/material.dart';

import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),
      backgroundColor: const Color(0xFFF1F5F9),
      body: Column(
        children: [
          // Top Green Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF00996E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white),
                    const Text(
                      "আল হাদিস",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.search, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                // Quote
                const Text(
                  '"তিনি বললেন, রাসূলুল্লাহ (সা.) বলেছেন, “আমি তোমাদেরকে কবর যিয়ারত করতে নিষেধ করেছিলাম এখন তোমরা উহার যিয়ারত করো।” (মুসলিম ৯৭৭)"',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 10),
                const Text(
                  '[১০০ সুসংগঠিত হাদিস]',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Shortcuts Section
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ShortcutItem(icon: Icons.history, label: "সর্বশেষ"),
                _ShortcutItem(icon: Icons.menu_book, label: "অ্যাপস"),
                _ShortcutItem(icon: Icons.send, label: "হাদিসে যান"),
                _ShortcutItem(icon: Icons.favorite, label: "সদাকা"),
              ],
            ),
          ),

          // All Hadith Books Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'সব হাদিসের বই',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // List of Books
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                HadithBookItem(
                  title: 'সহিহ বুখারী',
                  subtitle: 'ইমাম বুখারি',
                  count: '৭৫৬৩',
                  iconText: 'B',
                  iconColor: Color(0xFF56C596),
                ),
                HadithBookItem(
                  title: 'সহিহ মুসলিম',
                  subtitle: 'ইমাম মুসলিম',
                  count: '৭৫৫৩',
                  iconText: 'M',
                  iconColor: Color(0xFF369EFF),
                ),
                HadithBookItem(
                  title: 'সুনানে আন-নাসায়ী',
                  subtitle: 'ইমাম আন-নাসায়ী',
                  count: '৫৭৫৮',
                  iconText: 'N',
                  iconColor: Color(0xFF3D9A9A),
                ),
              ],
            ),
          ),
        ],
      ),

      // // Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: const Color(0xFF00996E),
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
      //   ],
      // ),
    );
  }
}

class _ShortcutItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ShortcutItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Color(0xFF00996E)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HadithBookItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final String iconText;
  final Color iconColor;

  const HadithBookItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.iconText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor,
          child: Text(iconText, style: const TextStyle(color: Colors.white)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Text('হাদিস', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
