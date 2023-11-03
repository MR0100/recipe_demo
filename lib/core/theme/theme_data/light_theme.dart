part of recipe_demo_theme;

/// This is the class contains all the colors of the light theme.
/// when user select the light mode in the application then we use light colors.
class LightTheme extends ThemeBase {
  /// This is the constructor of the light_theme to assign light colors.
  /// all the colors for light mode are defined in the constructor.
  LightTheme()
      : super(
          white: const Color(0xFFFFFFFF),
          black: const Color(0xFF1E1E1E),
          darkGray: const Color(0xFF404155),
          gray: const Color(0xFF8D99AE),
          lightGray: const Color(0xFFF7F7F9),
          blue: const Color(0xFF2D8CFF),
          lightBlue: const Color.fromARGB(255, 203, 224, 254),
          green: const Color(0xFF13A710),
          lightGreen: const Color(0xFFE7FFE1),
          orange: const Color(0xFFF38402),
          lightOrange: const Color(0xFFFAB722),
          red: const Color(0xFFFF1133),
          darkYellow: const Color(0xFFE7B416),
          yellow: const Color(0xFFFFC400),
          lightYellow: const Color(0xFFFFE600),
          darkPink: const Color(0xFFE61EAD),
          pink: const Color(0xFFFF2BFF),
          lightPink: const Color(0xFFFFB3FF),
          darkPurple: const Color.fromARGB(255, 67, 49, 162),
          purple: const Color.fromARGB(255, 124, 93, 247),
          lightPurple: const Color.fromARGB(255, 202, 189, 255),
        );
}
