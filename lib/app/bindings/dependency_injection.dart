
import 'package:al_hadith/app/view/screens/authentication/controller/auth_controller.dart';
import 'package:al_hadith/app/view/screens/splash/controller/splash_controller.dart';
import 'package:get/get.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);


  }
}