import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatefulWidget {
  const CustomPasswordTextfield({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState
    extends State<CustomPasswordTextfield> {
  var obsureText = true;
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),

          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: widget.controller,
            obscureText: obsureText,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.only(top: 16),
                hintText: 'Password',
                suffixIcon: GestureDetector(
                    onTap: () {
                      print('Tap 1');
                      setState(() {
                        print('Tap 2');
                        obsureText = !obsureText;

                      });
                    },
                    child: obsureText?
                         Icon(
                            Icons.visibility_off,
                            color: Colors.grey
                          )
                        : Icon(Icons.visibility, color: Colors.grey)
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}
