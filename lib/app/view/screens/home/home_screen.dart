import 'package:flutter/material.dart';

import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(width: 10),
            Text('আল হাদিস'),
          ],
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.notifications),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Quote
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.green,
              child: Text(
                '"তিনিও বললেন, রাসুলুল্লাহ (সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম) বলেছিলেন, "আমি তোমাদেরকে খবর দিয়ারত করতে নিবদ্ধ করেছিলাম এখন তোমরা উহার হিয়ারত করো!" (মুসলিম ৯৭৭)',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Subheading: All Hadith Books
            Text(
              'সব হাদিসের বই',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // List of Books (Sample data)
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('B', style: TextStyle(color: Colors.white)),
                    ),
                    title: Text('সাহিহ বুখারি'),
                    subtitle: Text('ইমাম বুখারি'),
                    trailing: Text('৭৫৬৩ হাদিস'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('M', style: TextStyle(color: Colors.white)),
                    ),
                    title: Text('সাহিহ মুসলিম'),
                    subtitle: Text('ইমাম মুসলিম'),
                    trailing: Text('৯৪৫৩ হাদিস'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text('N', style: TextStyle(color: Colors.white)),
                    ),
                    title: Text('সুন্নে আন-নাসাই'),
                    trailing: Text('৭৬৫৪ হাদিস'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}