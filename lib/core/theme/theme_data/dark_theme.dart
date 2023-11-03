part of recipe_demo_theme;

/// This is the class contains all the colors of the dark theme.
/// when user select the dark mode in the application then we use dark colors.
class DarkTheme extends ThemeBase {
  /// This is the constructor of the dark_theme to assign dark colors.
  /// all the colors for dark mode are defined in the constructor.
  DarkTheme()
      : super(
          white: const Color(0xFFFFFFFF),
          black: const Color(0xFF1E1E1E),
          darkGray: const Color(0xFF404155),
          gray: const Color(0xFF8D99AE),
          lightGray: const Color(0xFFF7F7F9),
          blue: const Color(0xFF295DFF),
          lightBlue: const Color.fromARGB(255, 203, 224, 254),
          green: Color.fromARGB(255, 12, 78, 11),
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
