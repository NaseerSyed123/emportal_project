//@dart=2.9
import 'dart:io';
import 'package:emportal_project/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'AppLayer/Provider.dart' as pro;
import 'AppLayer/Overseer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return pro.Provider(
      data: Overseer(),
      child: GetMaterialApp(
        title: 'Emportal Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
           fontFamily: 'JosefinSans',
          primaryColor: Color(0xffFDC500),
        ),
        home: SplashScreen(),
      ),
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}