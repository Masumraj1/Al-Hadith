import 'package:flutter/material.dart';

import '../../common_widgets/common_nav_bar/common_nav_bar.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const CommonNavBar(currentIndex: 2),

      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00996E),
        title: const Text(
          'Sahih Bukhari',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter Header
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                  children: [
                    TextSpan(
                      text: '1/1 Chapter: ',
                      style: TextStyle(
                        color: Color(0xFF00996E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'How the Divine Revelation started being revealed to Allah’s Messenger\n\n',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text:
                      'In publishing and graphic design, Lorem Ipsum is a placeholder text commonly used to demonstrate the visual form of a document...',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Hadith Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFF00996E),
                        child: Text(
                          'B',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hadith No: 01",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                            Text("Books Name",
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFF00996E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Sahih",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Arabic Hadith
                  const Text(
                    'عَنْ أَبِي هُرَيْرَةَ ... وَالدِّيْنِ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Amiri',
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Narrator
                  const Text(
                    "It is narrated from Abu Hurairah (may Allaah have mercy on him):",
                    style: TextStyle(
                      color: Color(0xFF00996E),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Bangla or English Translation
                  const Text(
                    'In publishing and graphic design, Lorem Ipsum is a placeholder text commonly used...',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),

                  const SizedBox(height: 16),

                  // Reference
                  Text(
                    '(See also 51, 2681, 2804...)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
