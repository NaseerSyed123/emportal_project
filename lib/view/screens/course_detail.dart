import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:emportal_project/view/screens/course_list.dart';
import 'package:emportal_project/view/screens/documents_list.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
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
          'Drive Assential',
          style: TextStyle(color: Colors.grey[600]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              width: 20,
              height: 20,
              child: Center(
                child: CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 3.0,
                  percent: 0.80,
                  center: new Text(
                    "80%",
                    style: TextStyle(fontSize: 10),
                  ),
                  progressColor: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SegmentedTabControl(
                  // Customization of widget
                  radius: Radius.circular(5),
                  backgroundColor: Colors.grey.shade300,
                  indicatorColor: Colors.orange.shade200,
                  tabTextColor: Colors.black45,

                  selectedTabTextColor: Colors.white,
                  squeezeIntensity: 2,
                  height: 45,
                  tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                  textStyle: TextStyle(fontSize: 17),
                  // textStyle: Theme.of(context).textTheme.bodyText1,
                  // Options for selection
                  // All specified values will override the [SegmentedTabControl] setting
                  tabs: [
                    SegmentTab(
                      label: 'Videos',

                      // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                      color: Color(0xffFDC500),
                      selectedTextColor: Colors.black,
                      textColor: Colors.black,
                    ),
                    SegmentTab(
                      label: 'Documents',
                      color: Color(0xffFDC500),
                      // backgroundColor: Colors.blue.shade100,
                      selectedTextColor: Colors.black,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              // Sample pages
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TabBarView(
                  // physics: const BouncingScrollPhysics(),
                  children: [CourseList(), DocumentsList()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
      child: Text(label),
    );
  }
}
