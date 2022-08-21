import 'package:emportal_project/AppLayer/Overseer.dart';
import 'package:emportal_project/view/screens/Login/login.dart';
import 'package:emportal_project/view/screens/courses_screen.dart';
import 'package:emportal_project/view/screens/damage_report.dart';
import 'package:emportal_project/view/screens/incident_report.dart';
import 'package:emportal_project/view/screens/notification_screen.dart';
import 'package:emportal_project/view/screens/shift_close.dart';
import 'package:emportal_project/view/screens/shift_detail_screen.dart';
import 'package:emportal_project/view/screens/survey/survey_screen.dart';
import 'package:emportal_project/view/screens/walkaround/walk_around_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String changeText = 'Start Shift';

  // String changeImg = 'assets/images/button.png';
  Color changeBgColor = Colors.black;
  Color changeContainerColor = Color(0xffFDC500);
  Color changeTextColor = Color(0xffFDC500);
  bool value = false;

  changeTxtImg() {
    if (value == false) {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  title: Text('Shift Start'),
                  children: [
                    Text('Are you suer'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ok'))
                  ],
                ));
        changeTextColor = Colors.black;
        changeText = 'Close Shift';
        changeBgColor = Color(0xffFDC500);
        changeContainerColor = Colors.black;

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ShiftClose()));
      });
      value = true;
    } else {
      setState(() {
        changeTextColor = Color(0xffFDC500);
        changeText = 'Start Shift ';
        changeBgColor = Colors.black;
        changeContainerColor = Color(0xffFDC500);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShiftClose()));
      });
      value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_img.jpg'),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications),
                  color: Colors.black,
                ),
                Positioned(
                  right: 13,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    width: 7,
                    height: 7,
                  ),
                )
              ]),
            ),
            IconButton(
                onPressed: () async{
                  Overseer.isLogout = true;
                  print("Logout SuccessFully");
                  SharedPreferences sharedP = await SharedPreferences.getInstance();
                  sharedP.setString('username',"");
                  Get.offAll(Login());
                  Get.snackbar(
                    "Log out ",
                    "Successfully  ..",
                    dismissDirection:
                    DismissDirection.horizontal,
                    isDismissible: true,
                    backgroundColor: Colors.amber,
                    duration: Duration(seconds: 2),
                  );
                },
                icon: Icon(
                  Icons.power_settings_new,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              InkWell(
                onTap: () {
                  changeTxtImg();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: changeBgColor),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: changeContainerColor,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '$changeText',
                              style: TextStyle(
                                  color: changeTextColor, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalkaroundScreen()));
                      },
                      child: homeContainer(
                          titleText: 'Walkaroung',
                          imageIcon: "assets/images/Walking.png"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SurveyScreen()));
                      },
                      child: homeContainer(
                          titleText: 'Survey Form',
                          imageIcon: "assets/images/Survey.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IncidentReport()));
                      },
                      child: homeContainer(
                          titleText: 'Insident Report',
                          imageIcon: "assets/images/Traffic Accident.png"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DamageReport()));
                      },
                      child: homeContainer(
                          titleText: 'Damage Report',
                          imageIcon: "assets/images/Hail Damage.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShiftDetailScreen()));
                      },
                      child: homeContainer(
                          titleText: 'Shift Detail',
                          imageIcon: "assets/images/shift_icon.png"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoursesScreen()));
                      },
                      child: homeContainer(
                          titleText: 'Training',
                          imageIcon: "assets/images/video_training_icon.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget homeContainer({required String titleText, required String imageIcon}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xffc1cacb),
                Color(0xffececec),
              ],
            ),
            // color: Color(0xffFDC500),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(imageIcon)),
              SizedBox(
                height: 10,
              ),
              Text(textAlign: TextAlign.center, titleText),
            ],
          ),
        ),
      ),
    );
  }
}
