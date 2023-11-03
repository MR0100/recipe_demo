library recipe_demo_theme;

import 'package:flutter/material.dart';

import '../settings/local_cache_key.dart';
import '../settings/variable_utilities.dart';

part 'theme_base.dart';
part 'theme_data/dark_theme.dart';
part 'theme_data/light_theme.dart';

/// This is the manager class of the application theme.
/// we can manage application using this class and methods of this class.
/// all the functions regarding theme will be in this class.
class ThemeManager {
  /// this function is used to manage theme and initialize theme data.
  static void initializeTheme(BuildContext context, {ThemeBase? theme}) {
    try {
      String applicationThemeMode = VariableUtilities.preferences
              .getString(LocalCacheKey.applicationThemeMode) ??
          'auto';
      switch (applicationThemeMode) {
        case 'light':

          /// here, we are setting data of the light mode.
          VariableUtilities.theme = LightTheme();
          break;
        case 'dark':

          /// here, we are setting data of the dark mode.
          VariableUtilities.theme = DarkTheme();
          break;
        default:

          /// we are fetching the current theme mode of the device.
          /// if the device is running dark mode then
          /// the platformBrightness is the Brightness.Dark
          Brightness platformBrightness =
              View.of(context).platformDispatcher.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            /// here, we are setting data of the dark mode.
            VariableUtilities.theme = DarkTheme();
          } else {
            /// here, we are setting data of the light mode.
            VariableUtilities.theme = LightTheme();
          }
      }
    } catch (e) {
      /// here, we are setting data of the light mode.
      VariableUtilities.theme = LightTheme();
    }
  }

  /// this is the function which is used to switch between the theme.
  static void switchTheme(BuildContext context, {bool isAuto = false}) {
    ThemeBase newTheme =
        VariableUtilities.theme is LightTheme ? DarkTheme() : LightTheme();
    VariableUtilities.preferences.setString(LocalCacheKey.applicationThemeMode,
        isAuto ? 'auto' : (newTheme is LightTheme ? 'light' : 'dark'));
    // setting new theme.
    initializeTheme(context, theme: newTheme);
  }
}
