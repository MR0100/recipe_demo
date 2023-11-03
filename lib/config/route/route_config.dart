import 'package:flutter/material.dart';
import 'package:recipe_demo/features/leading/view/leading_screen.dart';
import 'package:recipe_demo/features/recipe/view/recipe_details_screen.dart';

import '../../features/splash/view/splash_screen.dart';
import '../../features/users/view/user_screen.dart';

/// Manage all the routes used in the application.
class RouteConfig {
  /// first screen to open in the application.
  static const String root = '/';

  /// splash screen.
  static const String splashScreen = '/splashScreen';

  /// onboarding screens.
  static const String introScreen = '/introScreen';
  static const String welcomeScreen = '/welcomeScreen';

  /// user screen.
  static const String userScreen = '/userScreen';

  /// Authentications
  static const String registrationScreen = '/registrationScreen';
  static const String loginScreen = '/loginScreen';

  /// Leading (Dashboard)
  static const String leadingScreen = '/leadingScreen';

  /// Recipe
  static const String recipeDetailsScreen = '/recipeDetailsScreen';

  // we are using named route to navigate to another screen,
  // and while redirecting to the next screen we are using this function
  // to pass arguments and other routing things..
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? RouteConfig.root;

    // this is the instance of arguments to pass data in other screens.
    dynamic arguments = settings.arguments;

    switch (routeName) {
      case RouteConfig.root:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteConfig.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteConfig.userScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const UserScreen(),
        );
      case RouteConfig.leadingScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LeadingScreen(),
        );
      case RouteConfig.recipeDetailsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return RecipeDetailsScreen(
              recipe: arguments,
            );
          },
        );
    }
    return null;
  }
}
