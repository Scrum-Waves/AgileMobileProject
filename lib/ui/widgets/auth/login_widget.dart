import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container Login(BuildContext context, bool _isLogin) {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(right: 0, left: 0, bottom: 15, top: 30),
    child: Text(_isLogin ? 'Login' : 'Sign up',
        style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: (Theme.of(context).brightness.name == Brightness.light.name)
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryTextTheme.bodyText2?.color)),
  );
}
