import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:emportal_project/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
// import 'package:vehicle_walkaround_check/view/widgets/custom_button.dart';
// import 'package:vehicle_walkaround_check/view/widgets/custom_text_form_field.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Add Coctact',
          style: TextStyle(color: Colors.grey[600]),
        ),
        leading: IconButton(
         onPressed: (){
           Navigator.pop(context);
         },
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[600],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            // CusTomTextFormField(
            //     hintTxt: 'Full Name',
            //     passwordTxt: false,
            //     suffixIcon: Icons.person),
            SizedBox(
              height: 10,
            ),
            // CusTomTextFormField(
            //     hintTxt: 'Number', passwordTxt: false, suffixIcon: Icons.call),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: CustomButton(
                  buttonTitle: 'Add',
                  bgColor: Color(0xffFDC500),
                  borderColor: Color(0xffFDC500),
                  textColor: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
