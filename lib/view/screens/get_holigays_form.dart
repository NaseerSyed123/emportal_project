import 'package:emportal_project/view/widgets/custom_button.dart';

import 'package:flutter/material.dart';


class GetHoldaysForm extends StatefulWidget {
  const GetHoldaysForm({Key? key}) : super(key: key);

  @override
  State<GetHoldaysForm> createState() => _GetHoldaysFormState();
}

class _GetHoldaysFormState extends State<GetHoldaysForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Holiday',
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
          padding: EdgeInsets.zero,
          children: [
            Text(
                'This must be done two weeks in advance except it is an emergency'),
            SizedBox(
              height: 10,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    // CusTomTextFormField(
                    //     hintTxt: 'Start Date',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.calendar_month_outlined),
                    SizedBox(
                      height: 10,
                    ),
                    // CusTomTextFormField(
                    //     hintTxt: 'End Date',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.calendar_month_outlined),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'You leaves are more than 5 days, please mention a reason.'),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Color(0xfff5f5f5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Reason",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          minLines: 6,
                          // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomButton(
                          buttonTitle: 'Submit',
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
