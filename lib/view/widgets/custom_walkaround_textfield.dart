import 'package:flutter/material.dart';

class CustomWalkaroundTextfield extends StatefulWidget {
  late String hintTxt;
  late String type;
  late TextEditingController dateinput;
  late IconData suffixIcon;
  void Function(String value)? onChanged;
  final Function() notifyParent;

  CustomWalkaroundTextfield(
      {required this.hintTxt,
        required this.type,
      required this.suffixIcon,
      required this.onChanged,
      required this.notifyParent,
      required this.dateinput,
      });

  @override
  State<CustomWalkaroundTextfield> createState() =>
      _CustomWalkaroundTextfieldState();
}

class _CustomWalkaroundTextfieldState extends State<CustomWalkaroundTextfield> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation:1,
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
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            controller: widget.dateinput,
            decoration: InputDecoration(

              contentPadding: EdgeInsets.only(top: 18),
                suffixIcon: IconButton(
                  onPressed: () {
                    print("-- onpredssed 0");
                    widget.type;
                    print("-- onpredssed 1");
                    if(widget.type == "Calender"){
                      print("-- onpredssed 2");
                      widget.notifyParent();
                    }else if(widget.type == "Time"){
                      print("-- onpredssed 3");
                        widget.notifyParent();
                      }
                      else{
                      widget.notifyParent();

                    }

                    print("textfield type is ${widget.type}");
                  },
                  icon: Icon(widget.suffixIcon, color: Colors.grey),
                ),
                hintText: widget.hintTxt,
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}

