import 'package:flutter/material.dart';

class CusTomTextFormField extends StatefulWidget {
  late String hintTxt;
  late bool passwordTxt;
  late IconData suffixIcon;
  late String errorText;
  void Function(String value)? onChanged;

  CusTomTextFormField(
      {required this.hintTxt,
      required this.passwordTxt,
      required this.onChanged,
      required this.errorText,
      required this.suffixIcon});

  @override
  State<CusTomTextFormField> createState() => _CusTomTextFormFieldState();
}

class _CusTomTextFormFieldState extends State<CusTomTextFormField> {
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
            onChanged: widget.onChanged,
            obscureText: widget.passwordTxt,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 16),
                hintText: widget.hintTxt,
                errorText: widget.errorText,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(widget.suffixIcon, color: Colors.grey),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}
