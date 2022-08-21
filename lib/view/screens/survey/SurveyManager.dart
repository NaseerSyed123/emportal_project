import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'SurveyModel.dart';
import 'SurveyService.dart';

class SurveyManager {
  //

  final _searchField = BehaviorSubject<String>();

  Sink<String> get inSearchField => _searchField.sink;

  Stream<String> get searchField$ async* {
    yield await SurveyService.getEmpty();
  }

  final BehaviorSubject<List<SurveyModel>> _main =
      BehaviorSubject<List<SurveyModel>>();

  Stream<List<SurveyModel>> get mainList$ async* {
    print(" ------- called Again---");
    String query = "";


    yield await SurveyService.browse1(query);
  }

  SurveyManager() {
    print("-- getting data from stream in mainList");
    mainList$.listen((value) => _main.addStream(mainList$));
  }
}
