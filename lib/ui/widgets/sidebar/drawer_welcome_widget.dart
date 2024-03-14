import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/constants/assets/assets_path.dart';

Container DrawerWelcome(BuildContext context, String _mail) {
  return Container(
    color: Theme.of(context).appBarTheme.backgroundColor,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 17, bottom: 15, left: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CircleAvatar(
                maxRadius: 37,
                minRadius: 15,
                backgroundColor: Theme.of(context).primaryColorLight,
                backgroundImage: AssetImage(Assets.shapeDark),
                /*child: Text("",style: TextStyle(fontSize: 20.0, color: Colors.deepPurple))*/
              ),
              SizedBox(width: 10),
              ///////////////////////////////////////////////////
              /*Welcome(context)*/
              RichText(
                text: TextSpan(
                  text: 'Welcome to \n',
/*style: DefaultTextStyle.of(context).style,*/
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: (Theme.of(context).brightness.name ==
                              Brightness.light.name)
                          ? Colors.white70
                          : Theme.of(context).primaryTextTheme.bodyText2?.color,
                      fontSize: 27,
                    ),
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Task Now',
                        style: TextStyle(fontWeight: FontWeight.bold)),
//TextSpan(text: ' world!'),
                  ],
                ),
              )
              //////////////////////////////////////////////////
            ])),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(_mail, style: TextStyle(fontSize: 17)),
                SizedBox(height: 15),
              ]),
        ),
      ],
    ),
  )
      /*UserAccountsDrawerHeader(
                  accountName: Text(
                    "Email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(_mail, style: TextStyle(fontSize: 17)),
                  currentAccountPicture: CircleAvatar(
                      maxRadius: 30,
                      minRadius: 15,
                      backgroundColor: Colors.white70,
                      backgroundImage: AssetImage(Assets.shapeDark),
                      child: Text("",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.deepPurple))),
                ),*/
      ;
}
