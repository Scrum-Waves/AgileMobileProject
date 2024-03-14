import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText Welcome(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: 'Welcome to \n',
/*style: DefaultTextStyle.of(context).style,*/
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: (Theme.of(context).brightness.name == Brightness.light.name)
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryTextTheme.bodyText2?.color,
          fontSize: 27,
        ),
      ),
      children: const <TextSpan>[
        TextSpan(
            text: 'Task Now AI', style: TextStyle(fontWeight: FontWeight.bold)),
//TextSpan(text: ' world!'),
      ],
    ),
  );
}
