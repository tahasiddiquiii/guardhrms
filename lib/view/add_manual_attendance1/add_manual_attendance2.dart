import 'package:flutter/material.dart';
import 'package:security_app/view/add_manual_attendance1/add_manual_attendance.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/sign_up/sign_up_screen3.dart';

class AddManualAttendance2 extends StatefulWidget {
  const AddManualAttendance2({super.key});

  @override
  State<AddManualAttendance2> createState() => _AddManualAttendance2State();
}

class _AddManualAttendance2State extends State<AddManualAttendance2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: CustomButton(
            text: "Add",
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog(); // Using the custom dialog widget
                },
              );
              // Waiting for 5 seconds
              await Future.delayed(const Duration(seconds: 5));

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AppBottomNavBar3(
                          index: 0,
                        )),
              );
            },
          )),
      body: SingleChildScrollView(
        child: Column(
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
                                    builder: (context) =>
                                        AddManualAttendance()));
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
            _buildText(title: "Site Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(title: "Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Employee ID", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Date", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "05-03-24 , 09:00 AM"),
            ),
            buildVSpacer(20),
            _buildText(title: "Duty Hours", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Check-In Timing", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "05-03-24 , 09:00 AM"),
            ),
            buildVSpacer(20),
            _buildText(title: "Check-Out Timing", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "05-03-24 , 09:00 AM"),
            ),
            buildVSpacer(20),
            _buildText(title: "Add designation", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "05-03-24 , 09:00 AM",
                  suffixIcon: Icon(Icons.arrow_drop_down)),
            ),
          ],
        ),
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

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 18.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}

Widget _buildText1(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 0.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/added_attendance.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
