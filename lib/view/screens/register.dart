import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';


import '../widgets/custom_password_textformfield.dart';
import '../widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;

  void checkValue() {
    checkedValue = checkedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Image(image: AssetImage('assets/images/Logo.png')),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CusTomTextFormField(
                    //   hintTxt: 'User Name',
                    //   passwordTxt: false,
                    //   suffixIcon: Icons.person,
                    // ),
                    // CusTomTextFormField(
                    //   hintTxt: 'Truck Register',
                    //   passwordTxt: false,
                    //   suffixIcon: Icons.local_shipping,
                    // ),
                    // CusTomTextFormField(
                    //   hintTxt: 'Date/Time',
                    //   passwordTxt: false,
                    //   suffixIcon: Icons.calendar_month_outlined,
                    // ),
                    CustomPasswordTextfield(controller: passwordController),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: CheckboxListTile(
                        activeColor: Colors.black,
                        title: Text(
                          "Agree to our Privacy Policy",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomButton(
                          buttonTitle: 'Sign up',
                          bgColor: Color(0xffFDC500),
                          borderColor: Color(0xffFDC500),
                          textColor: Colors.black,
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CustomButton(
                    buttonTitle: 'Already Login ? ',
                    bgColor: Colors.white,
                    borderColor: Colors.grey,
                    textColor: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
