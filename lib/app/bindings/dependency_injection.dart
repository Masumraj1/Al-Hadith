

import 'package:get/get.dart';

import '../view/screens/home/controller/home_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);


  }
}