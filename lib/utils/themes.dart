import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        // ignore: deprecated_member_use
        buttonColor: darkBluishColor,

        // ignore: deprecated_member_use
        accentColor: Colors.black,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 3.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue)
        //     .copyWith(secondary: Colors.deepPurple),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness:
          Brightness.dark, // comment this to make prod description visible.
      fontFamily: GoogleFonts.poppins().fontFamily,

      // ignore: prefer_const_constructors
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      // ignore: deprecated_member_use
      buttonColor: lightBluishColor,

      // ignore: deprecated_member_use
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 3.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )));

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color.fromARGB(255, 106, 106, 109);
  static Color lightBluishColor = Color.fromARGB(255, 126, 123, 173);
}
