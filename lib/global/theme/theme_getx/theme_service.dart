import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../theme_data/theme_data_dark.dart';
import '../theme_data/theme_data_light.dart';
import '../theme_data/theme_data_light_grey.dart';

class ThemeService {
  //final yellowTheme = ThemeData.light().copyWith();

  //final greyTheme = ThemeData.light().copyWith();

  final yellowTheme = getThemeDataLight();

  final greyTheme = getThemeDataDark();

  final lightGreyTheme = getThemeDataLightGrey();

  //final lightTheme = ThemeData.light().copyWith();

  //final darkTheme = ThemeData.dark().copyWith();

  // Jedidi add Getx
  final _getStorage = GetStorage();

  final _greyThemeKey = 'isGreyTheme';
  //# Light Grey Theme
  final _greyLightThemeKey = 'isLightGreyTheme';

  //final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isGreyMode) {
    _getStorage.write(_greyThemeKey, isGreyMode);
    //yes
    _getStorage.write(_greyLightThemeKey, false);
  }

  //# Light Grey Theme
  void saveThemeDataLightGrey(bool isLightGreyMode) {
    _getStorage.write(_greyLightThemeKey, isLightGreyMode);
    //no
    //_getStorage.write(_greyThemeKey, false);
  }

  bool isSavedGreyMode() {
    return _getStorage.read(_greyThemeKey) ?? false;
  }

  //# Light Grey Theme
  bool isSavedLightGreyMode() {
    return _getStorage.read(_greyLightThemeKey) ?? false;
  }

  //bool isSavedDarkMode() {
  //  return _getStorage.read(_darkThemeKey) ?? false;
  //}

  ThemeData getThemeData() {
    return isSavedGreyMode()
        ? /*ThemeData.light()*/ getThemeDataDark()
        : /*ThemeData.light()*/ isSavedLightGreyMode()
            ? getThemeDataLightGrey()
            : getThemeDataLight();
  }

  //ThemeMode getThemeMode() {
  //  return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  //}

  void changeTheme() {
      // Jedidi add Getx
    Get.changeTheme(isSavedGreyMode()
        ? /*ThemeData.light()*/ getThemeDataLight()
        : /*ThemeData.light()*/ getThemeDataDark());
    saveThemeData(!isSavedGreyMode());
  }

  void changeThemeLight() {
      // Jedidi add Getx
    Get.changeTheme(isSavedLightGreyMode()
        ? /*ThemeData.light()*/ getThemeDataLight()
        : /*ThemeData.light()*/ getThemeDataLightGrey());
    saveThemeDataLightGrey(!isSavedLightGreyMode());
  }

  //void changeTheme() {
  //  Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.light);
  //  saveThemeData(!isSavedDarkMode());
  //}
}
