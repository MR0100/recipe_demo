import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

/// Splash Screen.
class SplashScreen extends StatefulWidget {
  /// Constructor of the Splash Screen.
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Start Timer...
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();
      bool isLogin = VariableUtilities.preferences.getBool('') ?? false;
      if (isLogin) {
        /// if user is logged in then redirect to the home screen.
        // String homeScreen = RouteConfig.dashboardScreen;
        String homeScreen = RouteConfig.leadingScreen;
        Navigator.pushReplacementNamed(context, homeScreen);
      } else {
        /// if user is not logged in then redirect to the login screen.
        String screen = RouteConfig.leadingScreen;

        /// if user is logged for the first time,
        /// then we are redirecting to the onboarding screen.
        if (_checkFirstTimeUser()) {
          screen = RouteConfig.leadingScreen;
        }
        Navigator.pushReplacementNamed(context, screen, arguments: {});
      }
    });
  }

  /// this is the function to check
  /// if the user is opening application for the first time,
  /// then showing onboarding screen
  /// otherwise skip onboarding screen.
  bool _checkFirstTimeUser() {
    return VariableUtilities.preferences
            .getBool(LocalCacheKey.applicationFirstTimeState) ??
        true;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VariableUtilities.screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: VariableUtilities.theme.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 140.hPr(context),
            width: 140.wPr(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: VariableUtilities.theme.white,
            ),
          ),
          SizedBox(height: 24.hPr(context)),
          Text(
            'Healthy Diet',
            style: FontUtilities.style(
              fontSize: 32,
              fontWeight: FWT.bold,
              fontColor: VariableUtilities.theme.white,
            ),
          ),
        ],
      )),
    );
  }
}
