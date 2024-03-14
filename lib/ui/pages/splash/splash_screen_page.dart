import 'package:flutter/material.dart';
import '../../../global/constants/assets/assets_path.dart';

class SplashScreenPage extends StatefulWidget {
  final Widget page;

  const SplashScreenPage({super.key, required this.page});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget.page),
        (route) => false,
      );

      /*Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.home,
        (route) => false,
      );*/
    });
  }
  ///////////////////////////////////////////////////////////////////////////
  //loadData();
  ///////////////////////////////////////////////////////////////////////////
  /*Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SpeechScreen()));
  }*/
  //////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: /*Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                Assets.logo,
                fit: BoxFit.contain,
              )),
        ],
      ),*/
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.logo, height: 200.0, fit: BoxFit.fill),
            SizedBox(
              height: 40,
            ),
            Text(
              'Welcome to Task Now AI',
              style: TextStyle(
                  color: Color.fromARGB(251, 156, 146, 5),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            /*SizedBox(
              height: 25,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),*/
          ],
        ),
      ),
    );
  }
}
