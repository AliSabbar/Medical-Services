import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: Colors.white,

// * APPBAR STYLE

    appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo'),
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        color: Colors.white,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark)),

// * TEXTFIELD STYLE

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textfieldColor,
      focusedBorder: InputBorder.none,
     
    ));

// ? ========================= DARK COLOR =========================

ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    // scaffoldBackgroundColor: darkColor //! < --- dark color,
    appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo'),
        // color: darkColor, //! < --- dark color
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            // statusBarColor: darkColor,
            statusBarIconBrightness: Brightness.light)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: darkColor, //! < --- dark color
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.grey,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
    bottomSheetTheme: BottomSheetThemeData(
        // backgroundColor: darkColor,   //! < --- dark color
        ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
    ));
