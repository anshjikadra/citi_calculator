import 'package:citi_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String MORE_APP = 'http://apps.apple.com/us/developer/jasmatbhai-satashiya/id1656353988';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ),
  );



  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    debugShowCheckedModeBanner: false,
    home: f_page(),
  ));
}
