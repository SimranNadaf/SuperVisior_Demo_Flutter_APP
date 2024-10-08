import 'package:login_app/widget/charts/ColumnChart.dart';
import 'package:login_app/widget/charts/barChart.dart';
import 'package:login_app/widget/charts/cartesianChart.dart';
import 'package:flutter/material.dart';
import 'package:login_app/widget/atdTab.dart';
import 'package:login_app/widget/atdTabButton.dart';
import 'package:login_app/widget/charts/piachart.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() {
    return AttendanceScreenState();
  }
}

class AttendanceScreenState extends State<AttendanceScreen> {
  bool isOver = true;
  bool isHoli = false;
  bool isWork = false;
  bool isLeave = false;

 

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Attendance Monitor",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 103, 34),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Atdtabbutton(
                title: "Overall",
                onActivited: isOver,
                onTapped: () {
                  setState(() {
                    isOver = true;
                    isHoli = false;
                    isWork = false;
                    isLeave = false;
                  });
                },
              ),
              Atdtabbutton(
                title: "Holidays",
                onActivited: isHoli,
                onTapped: () {
                  setState(() {
                    isOver = false;
                    isHoli = true;
                    isWork = false;
                    isLeave = false;
                  });
                },
              ),
              Atdtabbutton(
                title: "WorkDays",
                onActivited: isWork,
                onTapped: () {
                  setState(() {
                    isOver = false;
                    isHoli = false;
                    isWork = true;
                    isLeave = false;
                  });
                },
              ),
              Atdtabbutton(
                title: "Leaves",
                onActivited: isLeave,
                onTapped: () {
                  setState(() {
                    isOver = false;
                    isHoli = false;
                    isWork = false;
                    isLeave = true;
                  });
                },
              ),
            ],
          ),
          if (isOver)
            const AtdTab(
              title: "Overall Attendnace",
              chart: PiaChart(),
            ),
          if (isHoli)
            const AtdTab(title: "Holidays", chart: Cartesianchart()),
          if (isWork)
            const AtdTab(
              title: "Workdays",
              chart: BarChart(),
            ),
          if (isLeave)
             const AtdTab(
              title: "Leaves",
              chart: ColumnChart(),
            ),
        ],
      ),
    );
  }
}

