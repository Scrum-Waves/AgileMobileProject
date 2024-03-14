import 'package:flutter/material.dart';

import '../../todo/hive_db/toDo.dart';
import '../../ui/pages/bgRemover/bg_remover_screen.dart';
import '../../ui/pages/stt/speech3.dart';
//
//import '../../../modules/Blog/webflow_screen.dart';
//import '../../../modules/SocialMedia/HomePageBody.dart';
//import '../../../modules/getx/screens/welcome.dart';
import '../../ui/pages/auth/login_screen.dart';
//import '../../../ui/pages/extra/sharred_preference_screen.dart';
import '../../ui/pages/imageGen/image_generator_screen.dart';
import '../../ui/pages/stt/speech_screen.dart';
import '../../ui/pages/splash/splash_screen_page.dart';
import '../../ui/pages/splash/splash_screen_path.dart';
import '../../ui/pages/theme/theme_screen.dart';

import '../../ui/pages/tts/tts_screen.dart';

import '../../ui/pages/unfound/page_not_found.dart';

///*import '../../Blog/webflow_key_screen.dart';
//import '../../Blog/webflow_screen.dart';
//import '../../getx/screens/home_screen.dart';*/
//import '../../../modules/Blog/webflow_key_screen.dart';
//import '../../../modules/getx/screens/home_screen.dart';
import '../constants/routes/routes.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    //
    // Initial
    case Routes.initialPage:
      return MaterialPageRoute(
        builder: (context) => const SplashScreenPath(path: Routes.todo_page),
      );

    //
    // Splash
    case Routes.splash_page:
      return MaterialPageRoute(
        builder: (context) => const SplashScreenPage(page: ToDo()),
      );

    //
    // Login
    case Routes.login_page:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        /*HomeScreen(),*/
      );

    //
    // ToDo
    case Routes.todo_page:
      return MaterialPageRoute(
        builder: (context) => const ToDo(), /*WebflowKeyScreen()*/
        /*HomePageBody()*/ /*WebflowScreen()*/
        /* ThemeScreen()*/ /*WelcomeScreen()*/
      );

    //
    // Theme
    case Routes.theme_page:
      return MaterialPageRoute(
        builder: (context) => const ThemeScreen(),
      );

    //
    // Speech
    case Routes.speech_page:
      return MaterialPageRoute(
        builder: (context) => const SpeechScreen(),
      );

    //
    // Image
    case Routes.image_page:
      return MaterialPageRoute(
        builder: (context) => const ImageGenScreen(),
      );

    //
    // Bg
    case Routes.bg_page:
      return MaterialPageRoute(
        builder: (context) => const BgRemoverScreen(),
      );

    //
    // TTS
    case Routes.tts_page:
      return MaterialPageRoute(
        builder: (context) => const TtsScreen(),
        /* TTSScreen() */
      );

    //
    // STT
    case Routes.stt_page:
      return MaterialPageRoute(
        builder: (context) => const SpeechToTextScreen(),
      );

    //
    // unfound
    case Routes.stt_page:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );

    /*case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );*/
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
