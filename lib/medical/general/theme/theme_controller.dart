  // Jedidi add Getx
import 'package:get/get.dart';

  // Jedidi add Getx
class ThemeController extends GetxController {
    // Jedidi add Getx
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
  }
}
