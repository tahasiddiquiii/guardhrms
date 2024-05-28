import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/map_screen/map_screen.dart';

class ApprovalRequestScreen extends StatefulWidget {
  const ApprovalRequestScreen({super.key});

  @override
  State<ApprovalRequestScreen> createState() => _ApprovalRequestScreenState();
}

class _ApprovalRequestScreenState extends State<ApprovalRequestScreen> {
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
                        title: "Approval Request",
                        fontWeight: FontWeight.bold,
                        size: 16),
                  ],
                ),
              ),
            ],
          ),
          buildVSpacer(20),
          _buildText(
              title: "Request 01", size: 16, fontWeight: FontWeight.bold),
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
                                    title: "Name :",
                                    fontWeight: FontWeight.bold),
                                _buildText(
                                    title: "Suhas Bansali ",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Role :",
                                    fontWeight: FontWeight.bold),
                                _buildText(
                                    title: "Suhas Bansali ",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Emp.Id/Pf.No :",
                                    fontWeight: FontWeight.bold),
                                _buildText1(
                                    title: "123456",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            // _buildText(title: "Emp.Id/Pf.No : 123456 ", fontWeight: FontWeight.w400),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Check-In :",
                                    fontWeight: FontWeight.bold),
                                _buildText1(
                                    title: "05-03-24 , 09:00 AM",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            // _buildText(title: "Check-In : 05-03-24 , 09:00 AM", fontWeight: FontWeight.w400),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Check-Out :",
                                    fontWeight: FontWeight.bold),
                                _buildText1(
                                    title: "05-03-24 , 09:00 PM",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            // _buildText(title: "Check-Out : 05-03-24 , 09:00 PM", fontWeight: FontWeight.w400),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Revise Check-In :",
                                    fontWeight: FontWeight.bold),
                                _buildText1(
                                    title: "05-03-24 , 09:00 PM",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            // _buildText(title: "Revise Check-In : 05-03-24 , 09:00 AM", fontWeight: FontWeight.w400),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(
                                    title: "Revise Check-Out :",
                                    fontWeight: FontWeight.bold),
                                _buildText1(
                                    title: "05-03-24 , 09:00 PM",
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            // _buildText(title: "Revise Check-Out : 05-03-24 , 09:00 AM", fontWeight: FontWeight.w400),
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
                            // _buildText(title: "Location : Symboilc Apartments 34-B, Noida Uttar pradesh , India.", fontWeight: FontWeight.w400)),
                            buildVSpacer(30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const SuccessDialog(); // Using the custom dialog widget
                                        },
                                      );
                                      // Waiting for 5 seconds
                                      await Future.delayed(
                                          const Duration(seconds: 5));

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppBottomNavBar3(
                                                  index: 0,
                                                )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFF02946),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Approve",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                buildHSpacer(60),
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const SuccessDialog(); // Using the custom dialog widget
                                        },
                                      );
                                      // Waiting for 5 seconds
                                      await Future.delayed(
                                          const Duration(seconds: 5));

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppBottomNavBar3(
                                                  index: 0,
                                                )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Decline",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                          ],
                        ),
                      ),
                      buildVSpacer(30),
                    ],
                  ),
                ),
              ),
            ),
          ),
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

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/sucess_approval.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
