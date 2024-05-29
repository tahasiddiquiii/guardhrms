import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/add_manual_attendance1/add_manual_attendance.dart';
import 'package:security_app/view/add_manual_attendance2/add_manual_attendance01.dart';
import 'package:security_app/view/add_new_employee/add_new_employee_screen.dart';
import 'package:security_app/view/add_site_details/add_site_details_screen02.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/view/approval_request/approval_request_screen.dart';
import 'package:security_app/view/approval_request/approval_request_screen2.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/guard_screen/guard_screen.dart';
import 'package:security_app/view/leave_approval/leave_approvalScreen.dart';
import 'package:security_app/view/leave_approval/leave_approvalScreen02.dart';
import 'package:security_app/view/profile_update_request/profile_update_request_screen02.dart';
import 'package:security_app/view/reports/reports_screen.dart';
import 'package:security_app/view/reports/reports_screen02.dart';
import 'package:security_app/view/sign_up/sign_up_screen4.dart';

import '../../controller/profile_controller.dart';
import '../add_site_details/add_site_details_screen.dart';
import '../guard_screen02/guard_screen02.dart';

class AppDrawer4 extends StatefulWidget {
  const AppDrawer4({super.key});

  @override
  State<AppDrawer4> createState() => _AppDrawer4State();
}

class _AppDrawer4State extends State<AppDrawer4> {
  final profileController = Get.put(ProfileController());

  void _showUploadBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      backgroundColor: Colors.red,
      builder: (context) {
        return Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Really want to Logout ?',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen4()));
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
      child: SingleChildScrollView(child: Obx(() {
        return profileController.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Container(
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
                        const Icon(Icons.close)
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
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              image: NetworkImage(profileController
                                  .profileDetailsModel!.data!.profilePic!)),
                        ),
                      ),
                    ),
                    buildVSpacer(10),
                    _buildTextHeader(
                        title: profileController
                            .profileDetailsModel!.data!.fullName!,
                        fontWeight: FontWeight.w500,
                        size: 13),
                    buildVSpacer(5),
                    _buildTextHeader(
                        title: 'Branch Head / Regional Head',
                        fontWeight: FontWeight.w500,
                        size: 13,
                        color: Colors.red),
                    buildVSpacer(5),
                    _buildTextHeader(
                        title:
                            profileController.profileDetailsModel!.data!.email!,
                        fontWeight: FontWeight.w500,
                        size: 13),
                    buildVSpacer(50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ApprovalRequestScreen2()));
                            },
                            child: Image.asset("assets/approval.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddManualAttendance01()));
                            },
                            child: Image.asset("assets/manual_attendance.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddSiteDetailsScreen02()));
                            },
                            child: Image.asset("assets/add_site.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddNewEmployeeScreen()));
                            },
                            child: Image.asset("assets/add_employee.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileUpdateRequestScreen02()));
                            },
                            child: Image.asset("assets/profile_update.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReportScreen02()));
                            },
                            child: Image.asset("assets/report.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LeaveApprovalScreen02()));
                            },
                            child: Image.asset("assets/leave.png")),
                        buildVSpacer(25),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GuardScreen02()));
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
              );
      })),
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
