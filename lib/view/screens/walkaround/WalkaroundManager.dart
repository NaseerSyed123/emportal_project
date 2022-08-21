import 'package:emportal_project/AppLayer/Overseer.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'Myvalidation.dart';
import 'WalkaroundService.dart';
import 'dart:io';


class WalkaroundManager with Myvalidation {

  // calender , behaviour Subject , Sink and Stream
  final _calender = BehaviorSubject<String>();
  Sink<String> get inCalender => _calender.sink;
  Stream<String> get calender$ async*{
    yield await WalkaroundService.getEmpty();
  }


  // time , behaviour Subject , Sink and Stream
  final _time = BehaviorSubject<String>();
  Sink<String> get inTime => _time.sink;
  Stream<String> get time$ async*{
    yield await WalkaroundService.getEmpty();
  }

  // route , behaviour Subject , Sink and Stream
  final _route = BehaviorSubject<String>();
  Sink<String> get inRoute => _route.sink;
  Stream<String> get route$ async*{
    yield await WalkaroundService.getEmpty();
  }

  // driverName , behaviour Subject , Sink and Stream
  final _driverName = BehaviorSubject<String>();
  Sink<String> get inDriverName => _driverName.sink;
  Stream<String> get driverName$ async*{
    yield await WalkaroundService.getEmpty();
  }

  // vehicle , behaviour Subject , Sink and Stream
  final _vehicle = BehaviorSubject<String>();
  Sink<String> get inVehicle => _vehicle.sink;
  Stream<String> get vehicle$ async*{
    yield await WalkaroundService.getEmpty();
  }


  // milage , behaviour Subject , Sink and Stream
  final _milage = BehaviorSubject<String>();
  Sink<String> get inMilage => _milage.sink;
  Stream<String> get milage$ async*{
    yield await WalkaroundService.getEmpty();
  }

  final _auth = BehaviorSubject<String>();


  Stream<bool> get isFormSubmit$ async* {
    CombineLatestStream([calender$, time$,driverName$,vehicle$,milage$,route$], (values) => true);
    print("inside isUserAUTH  1 ");
    if(_calender.hasValue) {
      print("the real calender is _${_calender.value} ");
    }
    if(_time.hasValue) {
      print("the real time is _${_time.value} ");
    }
    if(_driverName.hasValue) {
      print("the real drivername is _${_driverName.value} ");
    }
    if(_route.hasValue) {
      print("the real route is _${_route.value} ");
    }
    if(_vehicle.hasValue) {
      print("the real vehicle is _${_vehicle.value} ");
    }
    if(_milage.hasValue) {
      print("the real milage is _${_milage.value} ");
    }
    if (_calender.value != null && _time.value != null && _route.value != null && _driverName.value != null
        && _vehicle.value != null && _milage.value != null ) {
      String query = "date=${_calender .value}&time=${_time.value}&driver_name=${_driverName.value}&route=${_route.value}"
          "&vehicle_details=${_vehicle.value}&milage_start=${_milage.value}";
      print('query is this from new stream ${query}');

      yield await WalkaroundService.submitForm(query);
    }
  }

  Stream<bool> get isFormValid$ {


    return  CombineLatestStream([calender$, time$,driverName$,vehicle$,milage$,route$], (values) => true);
  }





}
