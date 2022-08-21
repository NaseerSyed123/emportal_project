import 'package:emportal_project/view/widgets/custom_button.dart';

import 'package:flutter/material.dart';


class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Change Password',
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
            Image(image: AssetImage('assets/images/change_password.png')),
            Form(
                child: Column(
              children: [
                // CusTomTextFormField(
                //     hintTxt: 'Old Password',
                //     passwordTxt: false,
                //     suffixIcon: Icons.lock),
                // SizedBox(
                //   height: 10,
                // ),
                // CusTomTextFormField(
                //     hintTxt: 'New Password',
                //     passwordTxt: false,
                //     suffixIcon: Icons.lock),
                SizedBox(
                  height: 10,
                ),
                // CusTomTextFormField(
                //     hintTxt: 'Re-enter New Password',
                //     passwordTxt: false,
                //     suffixIcon: Icons.lock),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomButton(
                      buttonTitle: 'Update',
                      bgColor: Color(0xffFDC500),
                      borderColor: Color(0xffFDC500),
                      textColor: Colors.black87),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
