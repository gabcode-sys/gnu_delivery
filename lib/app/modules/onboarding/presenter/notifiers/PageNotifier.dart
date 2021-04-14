import 'package:flutter/material.dart';

class PageNotifier with ChangeNotifier {
  double _page = 0;
  double get page => _page;

  PageNotifier(PageController pageController) {
    pageController.addListener(() {
      _page = pageController.page;
      notifyListeners();
    });
  }
}
