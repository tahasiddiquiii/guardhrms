import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/register_screen/register_screen1.dart';
import 'package:security_app/view/register_screen/register_screen3.dart';

class EmployeeDetailScreen3 extends StatefulWidget {
  const EmployeeDetailScreen3({super.key});

  @override
  State<EmployeeDetailScreen3> createState() => _EmployeeDetailScreen3State();
}

class _EmployeeDetailScreen3State extends State<EmployeeDetailScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildVSpacer(80),
          Image.asset('assets/icon.png'),
          buildVSpacer(30),
          _buildTextHeader(
              title: 'Please Scan Your Face  Continue!',
              fontWeight: FontWeight.bold,
              size: 18,
              color: Colors.red),
          buildVSpacer(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Card(
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _buildTextHeader(
                        title: 'Employee Details', fontWeight: FontWeight.bold),
                    buildVSpacer(20),
                    Image.asset('assets/details.png'),
                    buildVSpacer(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomButton(
                          text: "Request to change",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen3(),
                              ),
                            );
                          }),
                    ),
                    buildVSpacer(20),
                  ],
                ),
              ),
            ),
          ),
          buildVSpacer(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Card(
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _buildTextHeader(
                        title: 'Facial Verification',
                        fontWeight: FontWeight.bold),
                    buildVSpacer(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomButton(
                          text: "Capture Your Face", onPressed: () {}),
                    ),
                    buildVSpacer(20),
                  ],
                ),
              ),
            ),
          ),
          buildVSpacer(90),
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
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
