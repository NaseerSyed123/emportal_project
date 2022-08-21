import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class ShiftDetailScreen extends StatefulWidget {
  @override
  _ShiftDetailScreenState createState() => new _ShiftDetailScreenState();
}

List<DateTime> walkinkgDates = [
  DateTime(2022, 07, 1),
  DateTime(2022, 07, 9),
  DateTime(2022, 07, 10),
  DateTime(2022, 07, 22),
  DateTime(2022, 07, 23),
];
List<DateTime> dayOffDates = [
  DateTime(2022, 07, 8),
  DateTime(2022, 07, 13),
  DateTime(2022, 07, 18),
  DateTime(2022, 07, 28),
];
List<DateTime> holidaysDates = [
  DateTime(2022, 07, 2),
  DateTime(2022, 07, 4),
  DateTime(2022, 07, 7),
  DateTime(2022, 07, 11),
  DateTime(2022, 07, 14),
  DateTime(2022, 07, 20),
  DateTime(2022, 07, 25),
];
List<DateTime> noShowDates = [
  DateTime(2022, 07, 6),
  DateTime(2022, 07, 16),
];
List<DateTime> notAllowedDates = [
  DateTime(2022, 07, 26),
  DateTime(2022, 07, 27),
  DateTime(2022, 07, 5),
];

class _ShiftDetailScreenState extends State<ShiftDetailScreen> {
  DateTime _currentDate2 = DateTime.now();

  static Widget _walkingIcon(String day) => CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  static Widget _dayOffIcon(String day) => CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  static Widget _holidayIcon(String day) => CircleAvatar(
        backgroundColor: Colors.yellow,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  static Widget _noShowIcon(String day) => CircleAvatar(
        backgroundColor: Colors.black,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  static Widget _notAllowedIcon(String day) => CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;

  // int len =  min(holidaysDates.length,(min(dayOffDates.length, walkinkgDates.length,  )));

  late double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    for (int i = 0; i < walkinkgDates.length; i++) {
      _markedDateMap.add(
        walkinkgDates[i],
        new Event(
          date: walkinkgDates[i],
          title: 'Event 5',
          icon: _walkingIcon(
            walkinkgDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < dayOffDates.length; i++) {
      _markedDateMap.add(
        dayOffDates[i],
        new Event(
          date: dayOffDates[i],
          title: 'Event 6',
          icon: _dayOffIcon(
            dayOffDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < holidaysDates.length; i++) {
      _markedDateMap.add(
        holidaysDates[i],
        new Event(
          date: holidaysDates[i],
          title: 'Event 7',
          icon: _holidayIcon(
            holidaysDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < noShowDates.length; i++) {
      _markedDateMap.add(
        noShowDates[i],
        new Event(
          date: noShowDates[i],
          title: 'Event 7',
          icon: _noShowIcon(
            noShowDates[i].day.toString(),
          ),
        ),
      );
    }
    for (int i = 0; i < notAllowedDates.length; i++) {
      _markedDateMap.add(
        notAllowedDates[i],
        new Event(
          date: notAllowedDates[i],
          title: 'Event 7',
          icon: _notAllowedIcon(
            notAllowedDates[i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 6,
      markedDateMoreShowTotal: null,
      // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
        ),
        title: Text(
          "Shift Detail",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(child: _calendarCarouselNoHeader),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      markerRepresent(Colors.green, "Walking"),
                      SizedBox(
                        height: 20,
                      ),
                      markerRepresent(Colors.red, "Day off"),
                      SizedBox(
                        height: 20,
                      ),
                      markerRepresent(Colors.yellow, "Holiday"),
                      SizedBox(
                        height: 20,
                      ),
                      markerRepresent(Colors.lightBlueAccent, "Off sick"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      markerRepresent(Colors.black, "No show"),
                      SizedBox(
                        height: 20,
                      ),
                      markerRepresent(Colors.blue, "Client cancle"),
                      SizedBox(
                        height: 20,
                      ),
                      markerRepresent(Colors.purple, "Not Alloud"),
                    ],
                  ),
                ],
              ),
            ),
            // markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color col, String data) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(color: col, shape: BoxShape.circle),
        ),
        SizedBox(
          width: 10,
        ),
        Text(data),
      ],
    );
  }
}
