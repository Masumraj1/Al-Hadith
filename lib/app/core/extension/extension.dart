


import 'package:al_hadith/app/core/routes/route_path.dart';

extension RouteBasePathExt on String {
  String get addBasePath {
    return RoutePath.basePath + this;
  }
}

