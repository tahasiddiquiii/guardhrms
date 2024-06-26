import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/map_screen/map_screen.dart';
import 'package:security_app/view/site_visit_report/site_visit_report_screen.dart';
import 'package:security_app/view/site_visit_report/view_site_report_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
                        title: "Site Visit Report",
                        fontWeight: FontWeight.bold,
                        size: 16),
                  ],
                ),
              ),
            ],
          ),
          buildVSpacer(20),
          _buildText(title: "Site 01", size: 16, fontWeight: FontWeight.bold),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppBottomNavBar3(
                              index: 3,
                            )));
              },
              child: Card(
                elevation: 5,
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      _buildText(
                                          title: "Date of Visit :",
                                          fontWeight: FontWeight.bold),
                                      _buildText(
                                          title: "09-09-2002 ",
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                  buildVSpacer(20),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MapScreen()),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        _buildText(
                                            title: "Location :",
                                            fontWeight: FontWeight.bold),
                                        Flexible(
                                            child: _buildText1(
                                                title:
                                                    "Symboilc Apartments 34-B, Noida Uttar pradesh , India.",
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  buildVSpacer(30),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 10),
                                      child: CustomButton(
                                        text: "View Report",
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewSiteReportScreen()),
                                          );
                                        },
                                      )),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Row(
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              //         child: CustomButton(text: "Resend", onPressed: (){}),
                              //       ),
                              //       Spacer(),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              //         child: CustomButton(text: "Resend", onPressed: (){}),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ),
                          ],

                          // buildVSpacer(30),
                        ))),
              ))
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
