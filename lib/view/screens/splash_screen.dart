import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login/login.dart';
import 'package:get/get.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () async{
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          String userStatus  = sharedPreferences.getString('username').toString();
          print("--- printing after splash loading ---> $userStatus");
          if (!userStatus.contains("user-logged-true")) {
            print(" -- going to login screen ");
            Get.to(Login(),);
          } else {
            print(" -- going to Main screen ");
            Get.to(Home());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    print("");
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage('assets/images/Logo.png')),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text("EMPORTAL", style: TextStyle(
              color: Color(0xffFDC500),
              fontSize: 20,


            ),),
            )
          ],
        ),
      )
    );
  }
}
