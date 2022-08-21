import 'package:flutter/material.dart';

class MessageModel {
  late String nameTxt;
  late String msgTxt;
  late String imgType;
  late String timeTxt;
  late String countTxt;
  late Color col;

  MessageModel(
      {required this.nameTxt,
      required this.msgTxt,
      required this.imgType,
      required this.timeTxt,
      required this.countTxt,
      required this.col});
}

List<MessageModel> dummyMessageList = [
  MessageModel(
      nameTxt: 'Admin',
      msgTxt: '2972 Westheimer Rd Santa Ana...',
      imgType: 'assets/images/admin_icon.png',
      timeTxt: '1:28 AM ',
      countTxt: '3',
      col: Colors.orange),
  MessageModel(
      nameTxt: 'Walkaround',
      msgTxt: '2972 Westheimer Rd Santa Ana...',
      imgType: 'assets/images/walkaround_icon.png',
      timeTxt: '1:28 AM ',
      countTxt: '3',
      col: Color(0xff10c6a5)),
  MessageModel(
      nameTxt: 'Survey',
      msgTxt: '2972 Westheimer Rd Santa Ana...',
      imgType: 'assets/images/survey_icon.png',
      timeTxt: '1:28 AM ',
      countTxt: '3',
      col: Color(0xff0d1db2)),
  MessageModel(
      nameTxt: 'Incident Report',
      msgTxt: '2972 Westheimer Rd Santa Ana...',
      imgType: 'assets/images/incident_icon.png',
      timeTxt: '1:28 AM ',
      countTxt: '3',
      col: Color(0xfff1b702)),
  MessageModel(
      nameTxt: 'Damage Report',
      msgTxt: '2972 Westheimer Rd Santa Ana...',
      imgType: 'assets/images/damage_icon.png',
      timeTxt: '1:28 AM ',
      countTxt: '3',
      col: Color(0xffba0aa9)),
];
