import 'package:flutter/material.dart';

import '../app_color/app_color_light_grey.dart';

ThemeData getThemeDataLightGrey() => ThemeData(
      useMaterial3: true,
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      brightness: Brightness.light,
      primarySwatch: AppColorsLightGrey.primarySwatchColor,
      primaryColor: AppColorsLightGrey.primaryColor,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        color: AppColorsLightGrey.appBarColor,
        centerTitle: true,
        //elevation: 10,
      ),
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      //primarySwatch: Colors.teal,
      //useMaterial3: true,
      /*textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(AppColorsLightGrey.textButtonColor),
        ),
      ),*/
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColorsLightGrey.floatingIconColor,
          backgroundColor: AppColorsLightGrey.floatingActionButtonColor,
          iconSize: 20),
      iconTheme:
          const IconThemeData(color: AppColorsLightGrey.iconColor, size: 20),
      primaryIconTheme:
          const IconThemeData(color: AppColorsLightGrey.iconColor),
      /*switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.cyanAccent),
        thumbColor: MaterialStateProperty.all(Colors.white10),
      ),*/
      dialogBackgroundColor: AppColorsLightGrey.dialogBgColor,
      scaffoldBackgroundColor: AppColorsLightGrey.scaffoldBgColor,
      shadowColor: AppColorsLightGrey.boxShadowColor,
      ////////////////////////////////////////////////////////
      listTileTheme: const ListTileThemeData(
        iconColor: AppColorsLightGrey.tileIconColor,
      ),
      /*inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.red,
          fillColor: Colors.red,
          border: OutlineInputBorder(),
          iconColor: Colors.red,
          hoverColor: Colors.red,
          labelStyle:
              TextStyle(color: Colors.red, backgroundColor: Colors.red),
      ),*/
      textTheme: getTextTheme(),
      /* style : Theme.of(context).textTheme.displayLarge */
      /* Wrap the theme of only one widget
         Theme( data : ThemeData( size: 10, color: Colors.black),
                child: Icon()Icons.access_alarms ),
      */
      dividerColor: AppColorsLightGrey.dividerColor,
      ////////////////////////////////////////////////////////////////
      unselectedWidgetColor: Colors.black54,
      toggleableActiveColor: Colors.teal,
      /*checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.teal),
        fillColor: MaterialStateProperty.all(Colors.black),
      ),*/
      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.indigoAccent),
        bodyText2: TextStyle(color: Colors.white70),
        //Tile text
        subtitle1: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8)),
        //Tile bg
        caption: TextStyle(color: Color.fromRGBO(175, 188, 207, 1)),
        //Tile icon edit
        button: TextStyle(color: Colors.black87),
        //Tile bg delete
        headline1: TextStyle(color: Color.fromRGBO(255, 0, 0, 0.8)),
      ),
    );

TextTheme getTextTheme() => TextTheme(
      displayLarge: TextStyle(color: Colors.black54, fontSize: 20),
      labelMedium: TextStyle(color: Colors.white, fontSize: 20),
    );
