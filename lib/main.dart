import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/utils/device_utils/device_utils.dart';
import 'app/data/database.dart';
import 'app/data/seeder/seeder.dart';
import 'app/view/screens/home/controller/home_controller.dart';
import 'my_app.dart';
// late AppDatabase db;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   // db = AppDatabase();
//   DeviceUtils.lockDevicePortrait();
//   runApp(const MyApp());
//
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDatabase = AppDatabase();
  await seedInitialBooks(appDatabase);

  // তারপর Get.lazyPut করো বা Controller ইনিশিয়ালাইজ করো
  Get.lazyPut(() => HomeController(appDatabase), fenix: true);

  runApp(MyApp());
}







//
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
//
// import 'app/core/utils/device_utils/device_utils.dart';
// import 'my_app.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   DeviceUtils.lockDevicePortrait();
//
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }
