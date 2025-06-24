

import 'package:al_hadith/app/core/routes/route_path.dart';
import 'package:al_hadith/app/core/routes/routes.dart';
import 'package:get/get.dart';




class SplashController extends GetxController{



  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), (){
      AppRouter.route.goNamed(RoutePath.homeScreen);
    });
    super.onReady();
  }

}