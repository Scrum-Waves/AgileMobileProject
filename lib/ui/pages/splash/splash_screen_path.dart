import 'package:flutter/material.dart';

import '../../../global/constants/assets/assets_path.dart';
import '../../../global/constants/utils/color_palette.dart';
import '../../../global/constants/utils/font_sizes.dart';
import '../../../ui/components/widgets.dart';

class SplashScreenPath extends StatefulWidget {
  final String path;

  const SplashScreenPath({super.key, required this.path});

  @override
  State<SplashScreenPath> createState() => _SplashScreenPathState();
}

class _SplashScreenPathState extends State<SplashScreenPath> {
  @override
  void initState() {super.initState();
    startTimer();
    
  }

  startTimer() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        widget.path,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.splashLogo,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            buildText('Task Now', kWhiteColor, textBold, FontWeight.w600,
                TextAlign.center, TextOverflow.clip),
            const SizedBox(
              height: 10,
            ),
            buildText(
                'Schedule an appointement with ease',
                kWhiteColor,
                textTiny,
                FontWeight.normal,
                TextAlign.center,
                TextOverflow.clip),
          ],
        )));
  }
}
