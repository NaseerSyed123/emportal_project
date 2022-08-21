import 'package:emportal_project/AppLayer/Overseer.dart';
import 'package:emportal_project/AppLayer/Provider.dart';
import 'package:emportal_project/view/screens/home.dart';
import 'package:emportal_project/view/screens/walkaround/WalkaroundManager.dart';
import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:emportal_project/view/widgets/custom_text_form_field.dart';
import 'package:emportal_project/view/widgets/custom_walkaround_textfield.dart';
import 'package:emportal_project/view/widgets/timerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WalkaroundScreen extends StatefulWidget {
  // const WalkaroundScreen({Key? key}) : super(key: key);

  @override
  State<WalkaroundScreen> createState() => _WalkaroundScreenState();
}

class _WalkaroundScreenState extends State<WalkaroundScreen> {
  TextEditingController textInputForDate = TextEditingController();
  TextEditingController textInputForTime = TextEditingController();
  TextEditingController textInputForDriverName = TextEditingController();
  TextEditingController textInputForRoute = TextEditingController();
  TextEditingController textInputForVehicle = TextEditingController();
  TextEditingController textInputForMilage = TextEditingController();

  @override
  void initState() {
    //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WalkaroundManager manager = Provider.of(context).fetch(WalkaroundManager);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Walkarround Check',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            // TimerScreen(),
            SizedBox(
              height: 30,
            ),
            Form(
                child: Column(
              children: [
                StreamBuilder<String>(
                    stream: manager.calender$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForDate,
                          type: "Calender",
                          notifyParent: callCalender,
                          hintTxt: 'Date',
                          suffixIcon: Icons.calendar_month,
                          onChanged: (value) {
                            manager.inCalender.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: manager.time$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForTime,
                          notifyParent: callTime,
                          type: 'Time',
                          hintTxt: 'Time',
                          suffixIcon: Icons.watch_later_outlined,
                          onChanged: (value) {
                            manager.inTime.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: manager.driverName$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForDriverName,
                          notifyParent: callText,
                          type: "Text",
                          hintTxt: 'Driver Name',
                          suffixIcon: Icons.person,
                          onChanged: (value) {
                            manager.inDriverName.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: manager.route$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForRoute,
                          notifyParent: callText,
                          type: 'text',
                          hintTxt: 'Rout',
                          suffixIcon: Icons.route,
                          onChanged: (value) {
                            manager.inRoute.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: manager.vehicle$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForVehicle,
                          notifyParent: callText,
                          type: 'text',
                          hintTxt: 'Vehicle Detail',
                          suffixIcon: Icons.local_shipping,
                          onChanged: (value) {
                            manager.inVehicle.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: manager.milage$,
                    builder: (context, snapshot) {
                      return CustomWalkaroundTextfield(
                          dateinput: textInputForMilage,
                          notifyParent: callText,
                          type: 'text',
                          hintTxt: 'Milage Start',
                          suffixIcon: Icons.social_distance,
                          onChanged: (value) {
                            manager.inMilage.add(value);
                          });
                    }),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: StreamBuilder<Object>(
                      stream: manager.isFormValid$,
                      builder: (context, snapshot) {
                        print(
                            "this is first call on submit ${snapshot.hasData}");
                        return InkWell(
                          onTap: () {
                            print("this is 2nd call on submit");
                            Get.snackbar(
                              "Submitting",
                              "Verifying User Details",
                              dismissDirection: DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 1),
                            );

                            print(" the actual datat is ${snapshot.hasData}");
                            if (snapshot.hasData) {
                              print("this is 3rd call after submit");
                              manager.isFormSubmit$.listen((event) async {
                                if (Overseer.is_user_valid) {
                                  print(
                                      'Login to home ${Overseer.is_user_valid}');
                                  Get.snackbar(
                                    "Congratulation",
                                    "Successfully LogIn with Emportal App",
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: Colors.amber,
                                    duration: Duration(seconds: 1),
                                  );
                                  Get.offAll(Home());
                                  // final SharedPreferences _sharedPreferences =
                                  //     await SharedPreferences.getInstance();
                                  // _sharedPreferences.setInt(
                                  //     'userId', Overseer.userId);

                                  // print("-------- the real role is ${Overseer.roleId}");
                                  // if(Overseer.roleId.contains("1")) {
                                  //   GetMTStockManager adminManager = Provider.of(context).fetch(GetMTStockManager);
                                  //   adminManager.myList.listen((event) {
                                  //     Get.offAll(AdminHomeScreen());
                                  //   });
                                  //
                                  //
                                  //
                                  // }else {
                                  //   Get.offAll(Home());
                                  // }
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return DoctorListScreen();
                                  //   }));
                                  // print("${_sharedPreferences.getInt('userId')}");

                                } else if (snapshot.hasError) {
                                  Get.snackbar(
                                    "Error",
                                    "Get some Error..",
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: Colors.amber,
                                    duration: Duration(seconds: 2),
                                  );
                                }
                              });
                            } else {
                              print('This is 4th call');
                              Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          child: CustomButton(
                              buttonTitle: 'Submit',
                              bgColor: Color(0xffFDC500),
                              borderColor: Color(0xffFDC500),
                              textColor: Colors.black87),
                        );
                      }),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  //

  callCalender() async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.amberAccent, // <-- SEE HERE
                  onPrimary: Colors.black, // <-- SEE HERE
                  onSurface: Colors.blueAccent,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // button text color
                  ),
                )),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        print("-- date picket text value ${formattedDate}");

        WalkaroundManager mgr = Provider.of(context).fetch(WalkaroundManager);
        textInputForDate.text = formattedDate;
        mgr.inCalender.add(formattedDate); //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }

    print("called parent calender widget");
  }

  callTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                background: Colors.black,
                primary: Colors.amberAccent, // <-- SEE HERE
                onPrimary: Colors.black, // <-- SEE HERE
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black, // button text color
                ),
              )),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      print("--- printing time ${pickedTime}");
      print("-- get hours ${pickedTime.hour}");
      String formattedTime =
          "${pickedTime.hour}:${pickedTime.minute}"; //DateFormat('HH:mm').format(DateTime( pickedTime.hour, pickedTime.minute));

      print(
          "-- after format ${DateTime(pickedTime.hour, pickedTime.minute)}"); //pickedDate output format => 2021-03-10 00:00:00.000

      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        print("-- date picket text value ${formattedTime}");

        WalkaroundManager mgr = Provider.of(context).fetch(WalkaroundManager);
        textInputForTime.text = formattedTime;
        mgr.inTime.add(formattedTime); //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }

    print("called parent Time widget");
  }

  callText() {
    print("called parent Text widget");
  }
}
