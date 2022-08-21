import 'dart:async';
import 'dart:convert';
import 'package:emportal_project/AppLayer/Overseer.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'LoginModel.dart';

import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;



class UserService {

  static Map<String, String>? _mainHeaders;

  static const String THEME = 'theme';
  static const String TOKEN = 'multivendor_token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String TOPIC = 'all_zone_customer';
  static const String ZONE_ID = 'zoneId';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';

  static Future<bool> browse(String query) async {
    //  Overseer over = new Overseer();
    print("-- AUTH SERVICE BROWSE METHOD 1.2");
    http.Response response;
    String _url = "";
    if (query != null && query.isNotEmpty) {       _url = 'https://emportal.etradeverse.com/api/User-Login?${query}';
      print("// final USER URL   hhh  >>>" + _url);
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Content-type': 'application/json',
      });

    } else {
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Content-type': 'application/json',
      });
    }
    print("getting for url " + _url);
    print("-- 1st Request status code 111111 ${response.statusCode}");

    //  response = await http.get(_url,headers: {'Access-Control-Allow-Origin': '*'});
    String content = response.body;
    Overseer.printWrapped("WRAPPED PRINTING STARTS HERE ------ " + content);
    if (response.statusCode != 200) {
      print(
          "########################## Error #####################################");

      //  print( '----------- token ---------->${cookie_token_value}<<<<<');
      print(
          "------------------------------------------------------------------------");
      print(
          "------------------------------------------------------------------------");
      //   print( '----------- session ---------->>${session_value}<<<<<');
      print(
          "############################## end #################################");
      Overseer.login_status = "user-not-exist";
      Overseer.is_user_valid = false;

      return false;
    } else {





      var jString = [content];
      //print("printig from service >>> 1-1 done"+jString.toString().substring(jString.toString().lastIndexOf("csrf_token")));

      String arr = jString.toString();
      
      List collection = json.decode(arr);
      print("status code logine before try"+response.statusCode.toString());
      if(Overseer.userId!=2) {
        try {
          print(
              "status code logine inside try" + response.statusCode.toString());
          print("//printig from service >>> ");
          if (response.statusCode != 200) {
            Overseer.login_status = "user-not-exist";
            Overseer.is_user_valid = false;

            print("login status from service " + Overseer.login_status);
          } else {
            print("Login SuccessFully ********");
            SharedPreferences sharedP = await SharedPreferences.getInstance();
            sharedP.setString('username',"user-logged-true");
            Overseer.login_status = "verified-user";
            Overseer.is_user_valid = true;

            List collection = json.decode(arr);
            print("user login parsing start");
            List<LoginModel> _userList =
            collection.map((json) => LoginModel.fromJson(json)).toList();
            print("user login parisng end");
            //  Overseer.userName = _userList[0].data.name+" "+_userList[0].data.email;
            setNotificationActive(true);
           // Overseer.userId = _userList[0].data.id;
            //Overseer.logKeys = _userList[0].logsKey;


          }

          print("end of listen with status " + Overseer.login_status);
        } catch (NoSuchMethodError) {
          print("NoSuchMethodError caught ..hahahaha  ${NoSuchMethodError}");
        }
      }
      return true;
    } // end of main top if ( does not contain error )
  }

  /////-----------------------------------------------

  static Future<bool> browseCustomer() async {

    http.Response response;
    String _url = "";

    var token1;
    if (token1 != null && token1.isNotEmpty) {
      print("// QUERY URL  token1 >>>" + token1);
      print(
          "// QUERY URL  csrf >>> 1-1 END-END " + Overseer.csrf_token_overseer);
      _url = 'https://newshop.welldoneapps.net/jsonapi/basket?id=default';
      response = await http.get(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer sdfhshfksdjhksdfhksdhf',
        'Accept': 'application/json',
        'X-CSRF-TOKEN': '${Overseer.csrf_token_overseer}',
      });
    } else {
      response = await http
          .get(Uri.parse(""), headers: {'Access-Control-Allow-Origin': '*'});
    }

    print("getting for url " + _url);
    String content = response.body;
    if (content.contains("Error:")) {
      return false;
    } else {
      var jString = [content];
      print("CUSTOMER DATA CUSTOMER DATA  >>>1 " +
          content.substring(content.lastIndexOf("attributes")));

      String arr = jString.toString();
      List collection = json.decode(arr);
      print("//printig from service >>>2 ");
      print("testing ");

      return true;
    } // end of main top if ( does not contain error )
  }

  /// get the OPtions from requests

  ///////-----------------------------------------------

  static Future browseOptionsCSRF() async {
    var content;
    if (content.contains("Error:")) {
      print("this is just AKS");
      // auth_user.authenticated = false;
      return false;
    } else {
      var jString = [""];
      print("CUSTOMER DATA CUSTOMER DATA  >>>1 " +
          content.substring(content.lastIndexOf("attributes")));

      String arr = jString.toString();
      List collection = json.decode(arr);
      print("//printig from service >>>2 ");

      print("testing options done");


      return true;
    } // end of main top if ( does not contain error )
  }







  bool clearSharedData() {
    if(!GetPlatform.isWeb) {
    //  FirebaseMessaging.instance.unsubscribeFromTopic(TOPIC);
      postData(TOKEN_URI, {"_method": "put", "cm_firebase_token": '@'});
    }
    return true;
  }
  static void setNotificationActive(bool isActive) async{
    if(isActive) {
      //updateToken();
    }else {
      // if(!GetPlatform.isWeb) {
      //   FirebaseMessaging.instance.unsubscribeFromTopic(TOPIC);
      //   if(isLoggedIn()) {
      //     FirebaseMessaging.instance.unsubscribeFromTopic('zone_${Get.find<LocationController>().getUserAddress().zoneId}_customer');
      //   }
      // }
    }

  }

  static final String noInternetMessage = 'Connection to API server failed due to internet connection';

  static Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzVhN2FiODE2N2EzNWQ5NWU5NGM5YjgxMzg3NzQ0OTUwZmExM2E0MWU4ZjhkZTkwNmY2NGYwOTM2NDgyYWNjOTM2OWE5ZTc5NzhiYTkyOTQiLCJpYXQiOjE2NTcwODI2MDcuODU2NjIsIm5iZiI6MTY1NzA4MjYwNy44NTY2MjYsImV4cCI6MTY4ODYxODYwNy40ODc2NzQsInN1YiI6IjI1Iiwic2NvcGVzIjpbXX0.03AgGqrrhBgmTu08Rqf6a-h8w2RG1J_5-8AHDMdcfRYpwMavSQ07hvEBQsGtp-uIF0QwYFhiy_f1aeMA7OtTOcy-OEd0JKoArrXB9ndIvEUdeJt8GKjy7oI13sqNjWQ-f98GUe5mfqrlnp_PBEgrhnF1blnKm1zp_vQGWHHhEW3AnFDcRldzc8uncrxFQFdF2pal3FFsDbpweVLXk5Ud-86qhLIpzYFOvbS0IqqmyfrlsI2aNf0l8uHZ6-UBFHZeqbJxmX2tZI7xJlfC-IM8w5FbQduC-efNWUGY0oQwqdcm6qx4csYdS5OGssokJzi37J_R6GUkH_Tl2smG2EUoSvms2jWkWzvnAxBjRH6mltcb4nD8pOMDlQhEoTAnoqVCVhdfdQgh8sX5gIQ5FEXwZ6fGig4UteuNhHNzCC-DMAhKd3oQZAxng7zSb4eYZ-N3-3wvDFxsP5jaX_SOXTksuDfyvXkIJh4pZYaDjTy4bHvt0G3qCUlHJpCO3AbRrEIyyVcgvQqL84s18j5U6dtSw6mVKOo7GTPP43D9g4lktTkk18PlIMkYRX3FCeP1qJbeeYInnFnH7qD2n8YvBTXZ6682DeiR1ipsLP4_porxpUngKCS4DTNwf1R-QpAgSJ8tVzsYA41_L4vZ2XVdjCJHvRyambVU',
     'X-localization':'en',
    };

    try {
      if(Foundation.kDebugMode) {
    //   print('====> API Call: $uri\nToken: $token');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.post(
        Uri.parse("https://s3bits.com/rooftech"+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: 30));
      Response response = handleResponse(_response);
      if(Foundation.kDebugMode) {
        print('====> API Response:>> [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Response handleResponse(Http.Response response) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body,
      bodyString: response.body.toString(), headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
    //    ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
      //  _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _errorResponse.errors[0].message);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    return _response;
  }

}
