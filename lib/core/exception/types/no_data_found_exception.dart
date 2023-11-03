part of recipe_demo_exceptions;

/// Class to handle Exception when Data not found.
class NoDataFoundException implements Exception {
  /// Constructor of NoDataFound Exceptions.
  NoDataFoundException();
  final String _title = '''No Data Found!''';
  final String _message = '''No Data Found!''';

  /// getter of message.
  String getMessage() => _message;

  /// show snackbar.
  void showToast(BuildContext context) {
    FancySnackbar.showSnackbar(
      context,
      title: _title,
      message: _message,
      snackBarType: FancySnackBarType.error,
    );
  }
}
