import 'dart:async';
import 'dart:convert';

import 'package:emportal_project/AppLayer/Overseer.dart';
import 'package:http/http.dart' as http;


import 'SurveyModel.dart';

class SurveyService {

  static Future<String> getEmpty() async {
    return "";
  }
  static Future<List<SurveyModel>> browse1(String query) async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");

    String queryURL =  "";


   queryURL = "https://emportal.etradeverse.com/api/load-question";
   response = await http.get(

     /// get the data
       Uri.parse(queryURL),
       headers: {
         'Access-Control-Allow-Origin': '*',
         'Accept': 'application/json',
         // 'Authorization':
         //     'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx
       });

    print("-- the REAL URL called >>> ${queryURL}");

    //,headers: {
    //       'Access-Control-Allow-Origin': '*',
    //       'Accept' : 'application/json',
    //       'Authorization':'Bearer ${Overseer.token}',
    //
    //     }
    print("got the response");
    String content = response.body;
    Overseer.printWrapped("printing onetnt for doctor list **** ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);
    print('print before parssing ');
    List<SurveyModel> _mainList =
        collection.map((json) => SurveyModel.fromJson(json)).toList();
   Overseer.surveyList[0]=_mainList[0];
   SurveyModel ss = Overseer.surveyList[0];
   ss.data[0]
    print('print after parssing ');
    // print("print image path ${_mainList[0].Data1[0].DayActivity1[0].image}");
    // print('day actvity lenth ${_mainList[0].Data1[0].DayActivity1[0].day}');
    print("model class lenth ${_mainList.length.toString()}");



    //Todo important code

    // end for loop

    return _mainList;
  }
}
