import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_textfield.dart';

enum Incident { yes, no }

class IncidentReport extends StatefulWidget {
  const IncidentReport({Key? key}) : super(key: key);

  @override
  State<IncidentReport> createState() => _IncidentReportState();
}

class _IncidentReportState extends State<IncidentReport> {
  late Incident _incidentReport = Incident.yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Incident Report',
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
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CusTomTextFormField(
                //     hintTxt: 'Damage id',
                //     passwordTxt: false,
                //     suffixIcon: Icons.receipt_long),
                // SizedBox(
                //   height: 5,
                // ),
                // CusTomTextFormField(
                //     hintTxt: 'Truck reg',
                //     passwordTxt: false,
                //     suffixIcon: Icons.local_shipping),
                // SizedBox(
                //   height: 5,
                // ),
                // CusTomTextFormField(
                //     hintTxt: 'Day',
                //     passwordTxt: false,
                //     suffixIcon: Icons.calendar_month_outlined),
                SizedBox(
                  height: 5,
                ),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Involving another vehicle ? ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xffFDC500),
                      ),
                      activeColor: Color(0xffFDC500),
                      value: Incident.yes,
                      groupValue: _incidentReport,
                      onChanged: (Incident? value) {
                        setState(() {
                          _incidentReport = value!;
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
                      value: Incident.no,
                      groupValue: _incidentReport,
                      onChanged: (Incident? value) {
                        setState(() {
                          _incidentReport = value!;
                        });
                      },
                    ),
                    Text('No'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Other vehical id',
                    )),
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Other driver name',
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Company',
                    )),
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Insure',
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Police incident No.',
                    )),
                    Flexible(
                        child: CustomTextfield(
                      hintTxt: 'Police id',
                    )),
                  ],
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
