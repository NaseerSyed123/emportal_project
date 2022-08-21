import 'package:emportal_project/AppLayer/Provider.dart';
import 'package:emportal_project/view/screens/survey/SurveyManager.dart';
import 'package:emportal_project/view/screens/survey/SurveyModel.dart';
import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum Surver1 { yes, no }

enum Surver2 { yes, no }

enum Surver3 { yes, no }

enum Surver4 { yes, no }

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  late Surver1 _survey1 = Surver1.yes;
  late Surver2 _survey2 = Surver2.yes;
  late Surver3 _survey3 = Surver3.yes;
  late Surver4 _survey4 = Surver4.yes;

  @override
  Widget build(BuildContext context) {
    SurveyManager manager = Provider.of(context).fetch(SurveyManager());
    manager.mainList$;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Survey',
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
            StreamBuilder<List<SurveyModel>>(
              stream: manager.mainList$,
              builder: (context, snapshot) {
                SurveyModel smodel = snapshot.data![0];
                return Text(
                "${smodel.data[0].title}"
                  ,
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                );
              }
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Are you truck driver ? ',
                            style: TextStyle(fontSize: 17),
                          ),
                          Row(
                            children: [
                              Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffFDC500),
                                ),
                                activeColor: Color(0xffFDC500),
                                value: Surver1.yes,
                                groupValue: _survey1,
                                onChanged: (Surver1? value) {
                                  setState(() {
                                    _survey1 = value!;
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
                                value: Surver1.no,
                                groupValue: _survey1,
                                onChanged: (Surver1? value) {
                                  setState(() {
                                    _survey1 = value!;
                                  });
                                },
                              ),
                              Text('No'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    })),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CustomButton(
                  buttonTitle: 'Finish',
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
