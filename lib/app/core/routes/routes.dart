import 'package:al_hadith/app/core/enums/transition_type.dart';
import 'package:al_hadith/app/core/extension/extension.dart';
import 'package:al_hadith/app/view/screens/chapters/chapters_screen.dart';
import 'package:al_hadith/app/view/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/hadith_details/hadith_details_screen.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.homeScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      ///======================= HomeScreen =======================
      GoRoute(
        name: RoutePath.homeScreen,
        path: RoutePath.homeScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: const HomeScreen(),
              state: state,
              disableAnimation: true,
            ),
      ),

      ///=======================  ChaptersScreen =======================
      GoRoute(
        name: RoutePath.chaptersScreen,
        path: RoutePath.chaptersScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: ChaptersScreen(),
              state: state,
              disableAnimation: true,
            ),
      ),

      ///=======================  HadithDetailsScreen =======================
      GoRoute(
        name: RoutePath.hadithDetailsScreen,
        path: RoutePath.hadithDetailsScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: const HadithDetailsScreen(),
              state: state,
              disableAnimation: true,
            ),
      ),
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
    bool disableAnimation = false,
    TransitionType transitionType = TransitionType.defaultTransition,
  }) {
    if (disableAnimation) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: Duration.zero, // Disable animation
        transitionsBuilder: (_, __, ___, child) => child, // No transition
      );
    }

    // Custom transition for Details Screen (center open animation)
    if (transitionType == TransitionType.detailsScreen) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Center Open Animation
          var curve = Curves.easeOut; // Smooth opening
          var tween = Tween(begin: 0.0, end: 1.0); // Scale transition
          var scaleAnimation = animation.drive(
            tween.chain(CurveTween(curve: curve)),
          );

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
    }

    // Default Slide Transition (right to left)
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
