import 'package:get/get.dart';

class ChapterController extends GetxController {
  final List<Map<String, dynamic>> categories = [
    {'letter': 'আ', 'titles': ['আকিদা', 'আমল ও নেকী', 'আখিরাত']},
    {'letter': 'ঈ', 'titles': ['ঈমান']},
    {'letter': 'দ', 'titles': ['দান সদকাহ', 'দোয়া']},
    {'letter': 'প', 'titles': ['পরিচিতা']},
    {'letter': 'ন', 'titles': ['নামাজ']},
    {'letter': 'র', 'titles': ['রোজা']},
    {'letter': 'য', 'titles': ['যাকাত']},
    {'letter': 'হ', 'titles': ['হজ্ব', 'হাদীস']},
    {'letter': 'স', 'titles': ['সুন্নাহ']},
    {'letter': 'ক', 'titles': ['কুরআন']},
    {'letter': 'মু', 'titles': ['মুসলিম পরিচিতি']},
    {'letter': 'বি', 'titles': ['বিশ্বাস ও কুফর']},
  ];

  /// প্রত্যেকটি বিষয়ের জন্য নির্দিষ্ট সাবটাইটেল (উপ-বিষয়) রিটার্ন করে
  List<String> getSubItemsForTitle(String title) {
    switch (title) {
      case 'আকিদা':
        return [
          'আল্লাহ কোথায় আছেন?',
          'আল্লাহর বিশেষ গুণাবলি',
          'আকিদার গুরুত্ব',
        ];
      case 'নামাজ':
        return [
          'নামাজ পড়ার নিয়ম',
          'নামাজের সময়সূচী',
          'নামাজে খুশু অর্জনের উপায়',
        ];
      case 'দান সদকাহ':
        return [
          'দান করার ফজিলত',
          'সদকাহ কীভাবে দিতে হয়?',
          'সদকাহ ও যাকাতের পার্থক্য',
          'দান করার নিয়ত কেমন হবে?',
        ];
      case 'রোজা':
        return [
          'রোজার উদ্দেশ্য ও গুরুত্ব',
          'রোজার মাসয়ালা',
          'ইফতারের দোয়া',
        ];
      case 'যাকাত':
        return [
          'যাকাতের হিসাব কিভাবে করব?',
          'কে কে যাকাত গ্রহণ করতে পারে?',
        ];
      case 'হাদীস':
        return [
          'সহিহ হাদীসের সংকলন',
          'জাল হাদীস চিনার উপায়',
        ];
      default:
        return [
          'উপ-বিষয় পাওয়া যায়নি',
        ];
    }
  }
}
