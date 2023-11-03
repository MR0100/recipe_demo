/// all the assets, images, video, audio and other files
/// used in the application.
///
/// are defined in this file.
class AssetUtilities {
  static const String _baseUrl = 'assets/';

  /// main images are related to logo, main banner etc.
  // static const String _mainImageBaseUrl = '${_baseUrl}images/main/';
  static const String _mainImageBaseUrl = '${_baseUrl}images/main/';

  /// extra images are related to other graphics used in the application.
  static const String _extraImageBaseUrl = '${_baseUrl}images/extra/';

  /// svg are mainly used for icons.
  static const String _svgBaseUrl = '${_baseUrl}svg/';

  static const String homeSvg = "${_svgBaseUrl}home_outlined.svg";
  static const String leftOverSvg = "${_svgBaseUrl}leftover_outlined.svg";
  static const String settingSvg = "${_svgBaseUrl}setting_outlined.svg";
  static const String shoppingSvg = "${_svgBaseUrl}shopping_outlined.svg";

  static const String chatBubbleOutlinedSvg =
      "${_svgBaseUrl}chat_bubble_outlined.svg";
  static const String filterOutlinedSvg = "${_svgBaseUrl}filter_outlined.svg";
  static const String shareOutlinedSvg = "${_svgBaseUrl}share_outlined.svg";
  static const String clockOutlinedSvg = "${_svgBaseUrl}clock_outlined.svg";
  static const String caloriesOutlinedSvg =
      "${_svgBaseUrl}calories_outlined.svg";

  /// Dialogue
  static const String resultSuccessImage =
      '${_extraImageBaseUrl}result_success_image.png';
  static const String resultFailedImage =
      '${_extraImageBaseUrl}result_failed_image.png';
}
