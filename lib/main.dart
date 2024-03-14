import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasknow/todo/hive_db/toDo.dart';

import 'medical/users/home/view/home_page_screen.dart';
import 'medical/doctor/app/auth/view/login_page.dart';
import 'ui/widgets/Row/HomePageBody.dart';
import 'Services/text_to_speech/tts.dart';

import 'global/constants/assets/assets_path.dart';
import 'global/router/app_router.dart';
import 'global/theme/theme_getx/theme_service.dart';
import 'global/constants/routes/routes.dart';
//import 'core/global/localization/translations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ui/widgets/Row/medication_row.dart';
import 'ui/pages/unfound/page_not_found.dart';

// async allows the use of await
Future<void> main() async {
  //useful when app relies on plugins or asynchronous operations during startup.
  WidgetsFlutterBinding.ensureInitialized();

  /*
  // Immersive => Full screen good for example : games or media players...
  // Full screen without status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  // making the status bar background fully transparent
  // => removes the status bar from view ( full-screen experience )
  // status bar style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  */

  // TTS Language
  TextToSpeech.initTTS();

  // SharedPreferences 1
  SharedPreferences preferences = await SharedPreferences.getInstance();
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Getx storage
  // Jedidi add Getx
  await GetStorage.init();

  // Jedidi add initialize hive
  await Hive.initFlutter();
  /*
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  */
  // Jedidi add open the box
  var box = await Hive.openBox('SmartDoAI');

  // Run app
  runApp(MyApp(
    // SharedPreferences 2
    preferences: preferences,
  ));
}

class MyApp extends StatelessWidget {
  // SharedPreferences 3
  final SharedPreferences preferences;
  // SharedPreferences 4
  MyApp({super.key, required SharedPreferences this.preferences});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Jedidi add Getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Assets.appTitle,

      /*****Theme******/
      theme: ThemeService().getThemeData(),
      //darkTheme: ThemeService().getThemeData(),
      themeMode: ThemeMode.light,

      /*****Routes******/
      routes: AppRouter().routeMaker(),
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
      //home: HomePageScreen(), //LoginView(),
      //onGenerateRoute: onGenerateRoute, //RouteGenerator.onGenerateRoute,
      //home: HomePageBody(),
      //initialRoute: Routes.splashHealthPage //Routes.splash_page /*Routes.todo_page*/, //"/",
      //home: /*HomePageBody()*/ /*ImageGenScreen()*/ /*WebFlowScreen()*/ /* GetX */ /*HomeScreen(),*/ WelcomeScreen(),
      //home: WebflowScreen(),
    );
  }
}

//'$_counter',
//style: Theme.of(context).textTheme.headline4,

//class MyApp extends StatefulWidget {
//  // SharedPreferences 3
//  final SharedPreferences preferences;
//  // SharedPreferences 4
//  MyApp({super.key, required SharedPreferences this.preferences});
//
//  @override
//  State<MyApp> createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  var isLogin = false;
//  var auth = FirebaseAuth.instance;
//  chekIfLogin() async {
//    auth.authStateChanges().listen((User? user) {
//      if (user != null && mounted) {
//        setState(() {
//          isLogin = true;
//        });
//      }
//    });
//  }
//
//  @override
//  void initState() {
//    chekIfLogin();
//    super.initState();
//  }
//
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return GetMaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Task Now',
//        /*****Theme******/
//        theme: ThemeService().getThemeData(),
//        //darkTheme: ThemeService().getThemeData(),
//        themeMode: ThemeMode.light,
//
//        /*****Routes******/
//        routes: AppRouter().routeMaker(),
//        //onGenerateRoute: onGenerateRoute, //RouteGenerator.onGenerateRoute,
//        initialRoute: isLogin
//            ? Routes.initialPage
//            : "/" //Routes.splash_page /*Routes.todo_page*/, //"/",
//        //home: /*HomePageBody()*/ /*ImageGenScreen()*/ /*WebFlowScreen()*/ /* GetX */ /*HomeScreen(),*/ WelcomeScreen(),
//        //home: WebflowScreen(),
//        );
//  }
//}
