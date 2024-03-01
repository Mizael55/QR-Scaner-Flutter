

import 'package:flutter/material.dart';
import 'package:qr_reader/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData defaultTheme = GlobalTheme.darkTheme;

  bool get isDarkMode{
    return defaultTheme == GlobalTheme.darkTheme;
  }

  void setDarkMode(bool value) {
    defaultTheme = value ? GlobalTheme.darkTheme : GlobalTheme.lightTheme;
    notifyListeners();
  }
}
