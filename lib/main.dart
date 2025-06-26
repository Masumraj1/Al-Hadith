import 'package:flutter/material.dart';

import 'app/core/utils/device_utils/device_utils.dart';
import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());

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
