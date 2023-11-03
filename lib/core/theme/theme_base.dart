part of recipe_demo_theme;

/// all the colores used in the application are managed using this theme_base.
/// if you want to use the additional colors then you can add in this class.
///
abstract class ThemeBase {
  /// Constructor of the theme_base to required all the colors.
  ThemeBase({
    required this.black,
    required this.darkGray,
    required this.gray,
    required this.lightGray,
    required this.blue,
    required this.lightBlue,
    required this.darkPurple,
    required this.purple,
    required this.lightPurple,
    required this.green,
    required this.lightGreen,
    required this.orange,
    required this.lightOrange,
    required this.red,
    required this.darkYellow,
    required this.yellow,
    required this.lightYellow,
    required this.darkPink,
    required this.pink,
    required this.lightPink,
    required this.white,
  });
  final Color transparent = Colors.transparent;

  final Color white;

  final Color black;
  final Color darkGray;
  final Color gray;
  final Color lightGray;

  final Color blue;
  final Color lightBlue;

  final Color darkPurple;
  final Color purple;
  final Color lightPurple;

  final Color green;
  final Color lightGreen;

  final Color orange;
  final Color lightOrange;

  final Color red;

  final Color darkYellow;
  final Color yellow;
  final Color lightYellow;

  final Color darkPink;
  final Color pink;
  final Color lightPink;
}
