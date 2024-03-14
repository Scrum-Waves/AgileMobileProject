import 'package:flutter/material.dart';

import '../../health/model/doctor_model.dart';
import '../../health/screens/detail_screen.dart';
import '../../medical/users/auth/view/login_page.dart' as user;
import '../../medical/doctor/app/auth/view/login_page.dart' as agent;
import '../../medical/users/home/view/home.dart';
import '../../medical/users/home/view/home_page_screen.dart';
import '../../health/screens/splash_screen_health.dart';
import '../../health/widgets/custom_route_widget.dart';
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

class AppRouter {
  Map<String, WidgetBuilder> routeMaker() {
    return <String, WidgetBuilder>{
      Routes.login_page: (context) => /*HomeScreen(),*/ const LoginScreen(),
      Routes.todo_page: (context) => /*WebflowKeyScreen()*/
          const ToDo() /*HomePageBody()*/
      /*WebflowScreen()*/ /* ThemeScreen()*/ /*WelcomeScreen()*/,
      Routes.speech_page: (context) => const SpeechScreen(),
      Routes.theme_page: (context) => const ThemeScreen(),
      Routes.image_page: (context) => const ImageGenScreen(),
      Routes.bg_page: (context) => const BgRemoverScreen(),

//      //old
//      //Routes.tts_page: (context) => TTSScreen(),
//
      //new
      Routes.tts_page: (context) => const TtsScreen(),

      Routes.stt_page: (context) => const SpeechToTextScreen(),
//
//      Routes.sharedPref_page: (context) => SharedPrefScreen(),
      Routes.splash_page: (context) => const SplashScreenPage(page: ToDo()),

      Routes.initialPage: (context) =>
          const SplashScreenPath(path: Routes.todo_page),

      // Health
      Routes.splashHealthPage: (context) =>
          SplashScreen(path: Routes.userLoginPage /*Routes.homeHealthPage*/),

      Routes.homeHealthPage: (context) => HomePageScreen(),

      // Medical user
      Routes.userLoginPage: (context) => user.LoginView(),

      // Medical home
      Routes.userHomePage: (context) => Home(),

      // Medical agent
      Routes.agentLoginPage: (context) => agent.LoginView(),
    };
  }

/*Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    //
    // Initial
    case Routes.initialPage:
      return MaterialPageRoute(
        builder: (context) => const SplashScreenPath(path: Routes.todo_page),
      );
  }
}*/
  /*case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );*/
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //
      // Initial
      /*case Routes.initialPage:
        return MaterialPageRoute(
          builder: (context) => const SplashScreenPath(path: Routes.todo_page),
        );*/
      //
      // Detail
      case Routes.detailHealthPage:
        final args = routeSettings.arguments as DoctorModel;
        return CustomRoute<bool>(
          builder: (context) => DetailScreen(
            model: args,
          ),
        );
      //
      // Unfound
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }

  /* Route onGenerateRoute(RouteSettings routeSettings) {
    final List<String> pathElements = routeSettings.name!.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
    }
    switch (pathElements[1]) {
      case "DetailPage":
        final args = routeSettings.arguments as DoctorModel;
        return CustomRoute<bool>(
          builder: (BuildContext context) => DetailScreen(
            model: args,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }*/
}
