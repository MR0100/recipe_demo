import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';
import 'config/provider/providers.dart';
import 'core/asset/assets.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(
    const recipe_appApplication(),
  );
}

///  Main application class from where the application will begin running.
class recipe_appApplication extends StatefulWidget {
  /// Constructor of the main class.
  const recipe_appApplication({Key? key}) : super(key: key);

  @override
  State<recipe_appApplication> createState() => _recipe_appApplicationState();
}

class _recipe_appApplicationState extends State<recipe_appApplication> {
  bool isSettingInitialized = false;
  // Configure Theme and Preference Settings.
  configSettings() async {
    VariableUtilities.preferences = await SharedPreferences.getInstance();
    if (context.mounted) {
      ThemeManager.initializeTheme(context);
    }
    isSettingInitialized = true;
    configLoader();
    setState(() {});
  }

  // Loading Indicator.
  configLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..radius = 10.0
      ..backgroundColor = VariableUtilities.theme.white
      ..indicatorColor = VariableUtilities.theme.blue
      ..contentPadding = EdgeInsets.zero
      ..textColor = VariableUtilities.theme.white
      ..maskColor = VariableUtilities.theme.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..indicatorWidget = Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: LottieUtilities.loadingIndicator02(),
      );
  }

  @override
  void initState() {
    configSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isSettingInitialized) {
      // TODO: This Should be image or Logo For Splash Screen.
      return const SizedBox();
    }
    return MultiProvider(
      providers: Providers.providers,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          initialRoute: RouteConfig.root,
          onGenerateRoute: RouteConfig.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          theme: ThemeData(
            scaffoldBackgroundColor: VariableUtilities.theme.white,

            /// this is the default font used for the application.
            fontFamily: 'Poppins',
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: VariableUtilities.theme.blue,
              selectionColor: VariableUtilities.theme.blue,
              selectionHandleColor: VariableUtilities.theme.blue,
            ),
          ),
        );
      },
    );
  }
}
