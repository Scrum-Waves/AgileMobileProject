import 'package:flutter/material.dart';

import '../app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      useMaterial3: true,
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      brightness: Brightness.light,
      primarySwatch: AppColorsLight.primarySwatchColor,
      primaryColor: AppColorsLight.primaryColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        color: AppColorsLight.appBarColor,
        centerTitle: true,
        //elevation: 10,
      ),
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      //primarySwatch: Colors.teal,
      //useMaterial3: true,
      /*textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(AppColorsLight.textButtonColor),
        ),
      ),*/
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColorsLight.floatingIconColor,
          backgroundColor: AppColorsLight.floatingActionButtonColor,
          iconSize: 20),
      iconTheme: const IconThemeData(color: AppColorsLight.iconColor, size: 20),
      primaryIconTheme: const IconThemeData(color: AppColorsLight.iconColor),
      /*switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.cyanAccent),
        thumbColor: MaterialStateProperty.all(Colors.white10),
      ),*/
      dialogBackgroundColor: AppColorsLight.dialogBgColor,
      scaffoldBackgroundColor: AppColorsLight.scaffoldBgColor,
      shadowColor: AppColorsLight.boxShadowColor,
      ////////////////////////////////////////////////////////
      listTileTheme: const ListTileThemeData(
        iconColor: AppColorsLight.tileIconColor,
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
      dividerColor: AppColorsLight.dividerColor,
      ////////////////////////////////////////////////////////////////
      unselectedWidgetColor: Colors.black54,
      toggleableActiveColor: Colors.green,
      /*checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.teal),
        fillColor: MaterialStateProperty.all(Colors.black),
      ),*/
      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.indigoAccent),
        bodyText2: TextStyle(color: Colors.white70),
        //Tile text
        subtitle1: TextStyle(color: Colors.black87),
        //Tile bg
        caption: TextStyle(color: Colors.yellow),
        //Tile icon edit
        button: TextStyle(color: Colors.black87),
        //Tile bg delete
        headline1: TextStyle(color: Colors.red.shade50),
      ),
    );

TextTheme getTextTheme() => TextTheme(
      displayLarge: TextStyle(color: Colors.black54, fontSize: 20),
      labelMedium: TextStyle(color: Colors.white, fontSize: 20),
    );
