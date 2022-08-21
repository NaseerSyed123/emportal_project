import 'package:emportal_project/AppLayer/Overseer.dart';
import 'package:emportal_project/AppLayer/Provider.dart';
import 'package:emportal_project/view/screens/Login/UserManager.dart';
import 'package:emportal_project/view/screens/home.dart';
import 'package:emportal_project/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:emportal_project/view/widgets/custom_button.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // bool checkedValue = false;
  //
  // void checkValue() {
  //   checkedValue = checkedValue;
  // }

  @override
  Widget build(BuildContext context) {
    print('Login Build 1');
    UserManager manager = Provider.of(context).fetch(UserManager);
    if (Overseer.isLogout == true) {
      manager.inEmail.add("");
      manager.inPassword.add("");
    }
    // UserManager manager = Provider.of(context).fetch(UserManager());
    print('Login Build 2');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image(image: AssetImage('assets/images/Logo.png')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<String>(
                          stream: manager.email$,
                          builder: (context, snapshot) {
                            return CusTomTextFormField(
                              onChanged: (value) {
                                manager.inEmail.add(value);
                              },
                              errorText: snapshot.error == null
                                  ? ""
                                  : snapshot.error.toString(),
                              hintTxt: 'User Name',
                              passwordTxt: false,
                              suffixIcon: Icons.person,
                            );
                          }),

                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<String>(
                          stream: manager.password$,
                          builder: (context, snapshot) {
                            return CusTomTextFormField(
                              onChanged: (value) {
                                manager.inPassword.add(value);
                              },
                              errorText: snapshot.error == null
                                  ? ""
                                  : snapshot.error.toString(),
                              hintTxt: 'Password',
                              passwordTxt: true,
                              suffixIcon: Icons.person,
                            );
                          }),
                      // CustomPasswordTextfield(controller: passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Padding(
                      //     padding: EdgeInsets.only(right: 8.0),
                      //     child: Text('Forget Password ?'),
                      //   ),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(10))),
                      //   child: CheckboxListTile(
                      //     activeColor: Colors.black,
                      //     checkColor: Color(0xffFDC500),
                      //     title: Text(
                      //       "Agree to our Privacy Policy",
                      //       style: TextStyle(color: Colors.black, fontSize: 15),
                      //     ),
                      //     value: checkedValue,
                      //     onChanged: (newValue) {
                      //       setState(() {
                      //         checkedValue = newValue!;
                      //       });
                      //     },
                      //     controlAffinity: ListTileControlAffinity
                      //         .leading, //  <-- leading Checkbox
                      //
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
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 1),
                                  );

                                  print(
                                      " the actual datat is ${snapshot.hasData}");
                                  if (snapshot.hasData) {
                                    print("this is 3rd call after submit");
                                    manager.isFormSubmit$.listen((event) async {
                                      if (Overseer.is_user_valid) {
                                        print(
                                            'Login to home ${Overseer.is_user_valid}');
                                        SharedPreferences sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        var userS = sharedPreferences
                                            .getString('username');
                                        String userStatus = "";

                                        if (userS != null) {
                                          userStatus = userS.toString();
                                        }
                                        print(
                                            "--- printing after splash loading ---> $userStatus");
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
                                      } else {
                                        Get.snackbar(
                                          "Login Error",
                                          "Please Enter Valid User Details ",
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          isDismissible: true,
                                          backgroundColor: Colors.red[200],
                                          duration: Duration(seconds: 1),
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
                                    borderColor: Color(0xffFDC500),
                                    textColor: Colors.black,
                                    buttonTitle: 'Login',
                                    bgColor: Color(0xffFDC500)),
                              );
                            }),
                      ),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 10),
                      //     child: Row(children: <Widget>[
                      //       Expanded(child: Divider()),
                      //       SizedBox(
                      //         width: 5,
                      //       ),
                      //       Text(
                      //         "OR",
                      //         style: TextStyle(color: Colors.grey),
                      //       ),
                      //       SizedBox(
                      //         width: 5,
                      //       ),
                      //       Expanded(child: Divider()),
                      //     ])),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      //
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => Register()));
                      //     },
                      //     child: CustomButton(
                      //       buttonTitle: 'Sign up',
                      //       bgColor: Colors.white,
                      //       borderColor: Colors.grey,
                      //       textColor: Colors.grey,
                      //     ),
                      //   ),
                      // )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
