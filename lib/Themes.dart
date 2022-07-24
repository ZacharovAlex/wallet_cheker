

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData defaultTheme = ThemeData(
  fontFamily: 'Gilroy',
   // systemOverlayStyle: SystemUiOverlayStyle.dark,

  //primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xFF0A0C1B),
  textTheme: const TextTheme(


       bodyText1: TextStyle(fontSize: 14,letterSpacing: 1,color: Colors.white),
    headline1: TextStyle(fontSize: 24,letterSpacing: 1,color: Colors.white,fontWeight: FontWeight.w500,height: 1.4 ),
    headline3: TextStyle(fontSize: 24,letterSpacing: 1,color: Colors.white,fontWeight: FontWeight.w600,height: 1 ),
    headline2: TextStyle(fontSize: 24,letterSpacing: 1,color: Color(0xFFff6d5c)),
    headline4: TextStyle(fontSize: 16,color: Colors.white,height: 1.42,fontWeight: FontWeight.w700),
  )
  //  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.white,)),
  //  backgroundColor:  Colors.black,//Color(0xFF0A0C1B),
);