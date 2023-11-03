import 'package:flutter/material.dart';

class LeadingProvider extends ChangeNotifier {
  int selectedPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void onInit(int sPI, {bool? update}) {
    selectedPageIndex = sPI;
    pageController = PageController(initialPage: sPI);
    if (update ?? false) {
      notifyListeners();
    }
  }

  void changeIndex(int index) {
    selectedPageIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}
