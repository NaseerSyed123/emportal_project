import 'package:emportal_project/view/widgets/custom_button.dart';

import 'package:flutter/material.dart';


enum Shift { start, end }

enum Report1 { yes, no }

enum Report2 { yes, no }

enum Report3 { yes, no }

enum Report4 { yes, no }

enum Report5 { yes, no }

enum Report6 { yes, no }

enum Report7 { yes, no }

class DamageReport extends StatefulWidget {
  const DamageReport({Key? key}) : super(key: key);

  @override
  State<DamageReport> createState() => _DamageReportState();
}

class _DamageReportState extends State<DamageReport> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue1 = false;
  bool checkedValue2 = false;

  void checkValue() {
    checkedValue1 = checkedValue1;
    checkedValue2 = checkedValue2;
  }

  late Shift _shift = Shift.start;
  late Report1 _report1 = Report1.yes;
  late Report2 _report2 = Report2.yes;
  late Report3 _report3 = Report3.yes;
  late Report4 _report4 = Report4.yes;
  late Report5 _report5 = Report5.yes;
  late Report6 _report6 = Report6.yes;
  late Report7 _report7 = Report7.yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Damage Report',
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
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CusTomTextFormField(
                    //     hintTxt: 'Reported by',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.receipt_long),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // CusTomTextFormField(
                    //     hintTxt: 'Vehicle reg',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.local_shipping),
                    SizedBox(
                      height: 5,
                    ),
                    // CusTomTextFormField(
                    //     hintTxt: 'Day',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.calendar_month_outlined),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // CusTomTextFormField(
                    //     hintTxt: 'Time',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.watch_later_outlined),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // CusTomTextFormField(
                    //     hintTxt: 'Location',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.pin_drop),
                    SizedBox(
                      height: 5,
                    ),
                    // CusTomTextFormField(
                    //     hintTxt: 'Additional comments',
                    //     passwordTxt: false,
                    //     suffixIcon: Icons.comment),
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
                              hintText: "Description",
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
                    Card(
                      color: Color(0xfff5f5f5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What shift are you reporting on ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Shift.start,
                                  groupValue: _shift,
                                  onChanged: (Shift? value) {
                                    setState(() {
                                      _shift = value!;
                                    });
                                  },
                                ),
                                Text('Start'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Shift.end,
                                  groupValue: _shift,
                                  onChanged: (Shift? value) {
                                    setState(() {
                                      _shift = value!;
                                    });
                                  },
                                ),
                                Text('End'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Is 5 th wheel okay ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report1.yes,
                                  groupValue: _report1,
                                  onChanged: (Report1? value) {
                                    setState(() {
                                      _report1 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report1.no,
                                  groupValue: _report1,
                                  onChanged: (Report1? value) {
                                    setState(() {
                                      _report1 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Is 5 th wheel level secure ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report2.yes,
                                  groupValue: _report2,
                                  onChanged: (Report2? value) {
                                    setState(() {
                                      _report2 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report2.no,
                                  groupValue: _report2,
                                  onChanged: (Report2? value) {
                                    setState(() {
                                      _report2 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Ramp behind 5th wheel okay ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report3.yes,
                                  groupValue: _report3,
                                  onChanged: (Report3? value) {
                                    setState(() {
                                      _report3 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report3.no,
                                  groupValue: _report3,
                                  onChanged: (Report3? value) {
                                    setState(() {
                                      _report3 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Battery cover by ramp still intact ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report4.yes,
                                  groupValue: _report4,
                                  onChanged: (Report4? value) {
                                    setState(() {
                                      _report4 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report4.no,
                                  groupValue: _report4,
                                  onChanged: (Report4? value) {
                                    setState(() {
                                      _report4 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Airline cable scure properly ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report5.yes,
                                  groupValue: _report5,
                                  onChanged: (Report5? value) {
                                    setState(() {
                                      _report5 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report5.no,
                                  groupValue: _report5,
                                  onChanged: (Report5? value) {
                                    setState(() {
                                      _report5 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'fuel/Adblue cap scure properly ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report6.yes,
                                  groupValue: _report6,
                                  onChanged: (Report6? value) {
                                    setState(() {
                                      _report6 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report6.no,
                                  groupValue: _report6,
                                  onChanged: (Report6? value) {
                                    setState(() {
                                      _report6 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Any damage reported ? ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report7.yes,
                                  groupValue: _report7,
                                  onChanged: (Report7? value) {
                                    setState(() {
                                      _report7 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report7.no,
                                  groupValue: _report7,
                                  onChanged: (Report7? value) {
                                    setState(() {
                                      _report7 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                      child: Text(
                        'Please confirm one of the following',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: CheckboxListTile(
                        checkColor: Colors.black,
                        activeColor: Color(0xffFDC500),
                        title: Text(
                          "There was no Techo card in the truck when I picked uo the truck.",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        value: checkedValue1,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue1 = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: CheckboxListTile(
                        checkColor: Colors.black,
                        activeColor: Color(0xffFDC500),
                        title: Text(
                          "There was no Techo card in the truck when I picked uo the truck.",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        value: checkedValue2,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue2 = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                    Card(
                      color: Color(0xfff5f5f5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              'Please confirm you have provided accurate information & did not provide misleading information.',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report7.yes,
                                  groupValue: _report7,
                                  onChanged: (Report7? value) {
                                    setState(() {
                                      _report7 = value!;
                                    });
                                  },
                                ),
                                Text('Yes'),
                                SizedBox(
                                  width: 50,
                                ),
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFDC500),
                                  ),
                                  activeColor: Color(0xffFDC500),
                                  value: Report7.no,
                                  groupValue: _report7,
                                  onChanged: (Report7? value) {
                                    setState(() {
                                      _report7 = value!;
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Attach Images',
                        style: TextStyle(color: Colors.grey[600], fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        child: Container(
                            color: Color(0xfff5f5f5),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/vehicle_img.png'),
                                        ));
                                  }),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: CustomButton(
                        textColor: Colors.white,
                        buttonTitle: 'Upload',
                        borderColor: Colors.white,
                        bgColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomButton(
                          textColor: Colors.black,
                          buttonTitle: 'Submit',
                          borderColor: Color(0xffFDC500),
                          bgColor: Color(0xffFDC500),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
