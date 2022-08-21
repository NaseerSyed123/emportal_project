import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  late String hintTxt;

  CustomTextfield({required this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            decoration: InputDecoration(

                hintText: hintTxt,
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}
