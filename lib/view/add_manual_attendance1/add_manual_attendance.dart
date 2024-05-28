import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_app/view/add_manual_attendance1/add_manual_attendance2.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';

class AddManualAttendance extends StatefulWidget {
  const AddManualAttendance({super.key});

  @override
  State<AddManualAttendance> createState() => _AddManualAttendanceState();
}

class _AddManualAttendanceState extends State<AddManualAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildVSpacer(50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppBottomNavBar3(
                                        index: 0,
                                      )));
                        },
                        child: Icon(Icons.arrow_back_ios)),
                    buildHSpacer(100),
                    _buildTextHeader(
                        title: "Add Manual Attendance",
                        fontWeight: FontWeight.bold,
                        size: 16),
                  ],
                ),
              ),
            ],
          ),
          buildVSpacer(20),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddManualAttendance2()));
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: buildCustomTextField1(
                    hintText: "Search Name/Employee ID",
                    prefixIcon: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddManualAttendance2()));
                        },
                        child: Icon(Icons.search)))),
          ),
          _buildTextHeader(title: "Note : Search to Fetch Data")
        ],
      ),
    );
  }
}

Widget _buildTextHeader(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}
