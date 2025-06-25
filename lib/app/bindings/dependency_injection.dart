

import 'package:get/get.dart';

import '../view/screens/chapters/controller/chapter_controller.dart';
import '../view/screens/hadith_details/controller/hadith_details_controller.dart';
import '../view/screens/home/controller/home_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ChapterController(), fenix: true);
    Get.lazyPut(() => HadithDetailsController(), fenix: true);


  }
}