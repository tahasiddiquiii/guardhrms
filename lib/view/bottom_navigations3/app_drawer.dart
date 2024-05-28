import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/add_manual_attendance1/add_manual_attendance.dart';
import 'package:security_app/view/add_new_employee/add_new_employee_screen.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/view/approval_request/approval_request_screen.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/guard_screen/guard_screen.dart';
import 'package:security_app/view/leave_approval/leave_approvalScreen.dart';
import 'package:security_app/view/profile_update_request/profile_update_request_screen01.dart';
import 'package:security_app/view/profile_update_request/profile_update_request_screen02.dart';
import 'package:security_app/view/reports/reports_screen.dart';
import 'package:security_app/view/sign_up/sign_up_screen3.dart';

import '../add_site_details/add_site_details_screen.dart';

class AppDrawer3 extends StatefulWidget {
  const AppDrawer3({super.key});

  @override
  State<AppDrawer3> createState() => _AppDrawer3State();
}

class _AppDrawer3State extends State<AppDrawer3> {
  void _showUploadBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      backgroundColor: Colors.red,
      builder: (context) {
        return Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Really want to Logout ?',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen3()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Image(image: AssetImage('assets/camera.png'), color: Colors.red,),
                        // buildHSpacer(10),
                        Text(
                          'Yes',
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Image(image: AssetImage('assets/gallery.png'), color: Colors.red,),
                        // buildHSpacer(10),
                        Text(
                          'No',
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              buildVSpacer(80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextHeader(
                      title: 'Main Menu',
                      fontWeight: FontWeight.w600,
                      size: 17,
                      color: Colors.red),
                  buildHSpacer(10),
                  Icon(Icons.close)
                ],
              ),
              buildVSpacer(35),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AppBottomNavBar(
                          index: 3,
                        ),
                      ),
                    );
                  },
                  child: Image.asset('assets/profile.png')),
              buildVSpacer(10),
              _buildTextHeader(
                  title: 'Sujan', fontWeight: FontWeight.w500, size: 13),
              buildVSpacer(5),
              _buildTextHeader(
                  title: 'Field Officer / Area Manager',
                  fontWeight: FontWeight.w500,
                  size: 13,
                  color: Colors.red),
              buildVSpacer(5),
              _buildTextHeader(
                  title: 'Sujan@gmail.com',
                  fontWeight: FontWeight.w500,
                  size: 13),
              buildVSpacer(50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ApprovalRequestScreen()));
                      },
                      child: Image.asset("assets/approval.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddManualAttendance()));
                      },
                      child: Image.asset("assets/manual_attendance.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddSiteDetailsScreen()));
                      },
                      child: Image.asset("assets/add_site.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewEmployeeScreen()));
                      },
                      child: Image.asset("assets/add_employee.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileUpdateRequestScreen01()));
                      },
                      child: Image.asset("assets/profile_update.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportScreen()));
                      },
                      child: Image.asset("assets/report.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaveApprovalScreen01()));
                      },
                      child: Image.asset("assets/leave.png")),
                  buildVSpacer(25),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuardScreen()));
                      },
                      child: Image.asset("assets/guard.png")),
                ],
              ),
              buildVSpacer(100),
              GestureDetector(
                onTap: () {
                  _showUploadBottomSheet();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Image.asset("assets/logout.png"),
                      buildVSpacer(10),
                      _buildTextHeader(
                          title: 'Logout',
                          fontWeight: FontWeight.w500,
                          size: 13,
                          color: Colors.red),
                    ],
                  ),
                ),
              ),
              buildVSpacer(30)
            ],
          ),
        ),
      ),
    );
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
}
