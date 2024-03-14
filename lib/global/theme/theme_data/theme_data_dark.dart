import 'package:flutter/material.dart';

import '../app_color/app_color_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
      useMaterial3: true,
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      brightness: Brightness.dark,
      primarySwatch: AppColorsDark.primarySwatchColor,
      primaryColor: AppColorsDark.primaryColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        color: AppColorsDark.appBarColor,
        centerTitle: true,
        //elevation: 10,
      ),
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      //primarySwatch: Colors.teal,
      //useMaterial3: true,
      /*textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(AppColorsDark.textButtonColor),
        ),
      ),*/
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColorsDark.floatingIconColor,
          backgroundColor: AppColorsDark.floatingActionButtonColor,
          iconSize: 20),
      iconTheme: const IconThemeData(color: AppColorsDark.iconColor, size: 20),
      primaryIconTheme: const IconThemeData(color: AppColorsDark.iconColor),
      /*switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.cyanAccent),
        thumbColor: MaterialStateProperty.all(Colors.white10),
      ),*/
      dialogBackgroundColor: AppColorsDark.dialogBgColor,
      scaffoldBackgroundColor: AppColorsDark.scaffoldBgColor,
      shadowColor: AppColorsDark.boxShadowColor,
      ////////////////////////////////////////////////////////
      listTileTheme: const ListTileThemeData(
        iconColor: AppColorsDark.tileIconColor,
      ),
      /*inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.red,
        fillColor: Colors.red,
        border: OutlineInputBorder(),
        iconColor: Colors.red,
        hoverColor: Colors.red,
        labelStyle: TextStyle(color: Colors.red, backgroundColor: Colors.red),
      ),*/
      textTheme: getTextTheme(),
      /* style : Theme.of(context).textTheme.displayLarge */
      /* Wrap the theme of only one widget
         Theme( data : ThemeData( size: 10, color: Colors.black),
                child: Icon()Icons.access_alarms ),
      */
      dividerColor: AppColorsDark.dividerColor,
      ///////////////////////////////////////////////////////////////////Extra
      unselectedWidgetColor: Colors.black54,
      toggleableActiveColor: Colors.teal,
      /*checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.teal),
        fillColor: MaterialStateProperty.all(Colors.black),
      ),*/
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.indigoAccent),
        bodyText2: TextStyle(color: Colors.white70),
        //Tile text
        subtitle1: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
        //Tile bg
        caption: TextStyle(color: Color(0xFF6F61C4)),
        //Tile icon edit
        button: TextStyle(color: Colors.white),
        //Tile bg delete
        headline1: TextStyle(color: Color.fromRGBO(255, 0, 0, 0.9)),
      ),
    );

TextTheme getTextTheme() => TextTheme(
      displayLarge: TextStyle(color: Colors.black54, fontSize: 20),
      labelMedium: TextStyle(color: Colors.white, fontSize: 20),
    );
