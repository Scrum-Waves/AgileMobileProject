import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText Sign(BuildContext context, String buttonText, bool _isLogin) {
  String btnGuide =
      _isLogin ? "Does not have account?" : "Already have account?";
  return RichText(
    text: TextSpan(
      text: btnGuide + " \t\t",
/*style: DefaultTextStyle.of(context).style,*/
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: (Theme.of(context).brightness.name == Brightness.light.name)
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryTextTheme.bodyText2?.color,
          fontSize: 16,
        ),
      ),
      children: <TextSpan>[
        TextSpan(
            text: buttonText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  (Theme.of(context).brightness.name == Brightness.light.name)
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryTextTheme.bodyText1?.color,
            )),
//TextSpan(text: ' world!'),
      ],
    ),
  );
}
