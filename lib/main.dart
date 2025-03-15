import 'package:flutter/material.dart';
import 'package:recipe_app/app/global/helper/device_utils/device_utils.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());
}




