//import 'package:flutter/material.dart';
//
//
//
//import '../../../modules/getx/screens/home_screen.dart';
//import 'routes/routes.dart';
//
//
//class RouteGenerator {
//  static Route? onGenerateRoute(RouteSettings settings) {
//    // Getting arguments passed in while calling Navigator.pushNamed
//    final args = settings.arguments;
//
//    switch (settings.name) {
//      // "/screen1"
//      case Routes.speech_page:
//        if (args is String) {
//          return MaterialPageRoute(builder: (_) => HomeScreen(),//SpeechScreen()
//          );
//        } else {
//          return _errorRoute();
//        }
//      default:
//        return _errorRoute();
//    }
//  }
//}
//
//// static Route<dynamic>
//Route? _errorRoute() {
//  return MaterialPageRoute(builder: (_) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Error, No Internet Connection')),
//      body: Center(child: Text("No Internet Connection")),
//    );
//  });
//}
//