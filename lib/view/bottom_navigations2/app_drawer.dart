import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/sign_up/sign_up_screen1.dart';
import 'package:security_app/view/sign_up/sign_up_screen2.dart';

class AppDrawer2 extends StatefulWidget {
  const AppDrawer2({super.key});

  @override
  State<AppDrawer2> createState() => _AppDrawer2State();
}

class _AppDrawer2State extends State<AppDrawer2> {
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
                              builder: (context) => SignUpScreen2()));
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
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AppBottomNavBar(
                  index: 3,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
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
                  Image.asset('assets/profile.png'),
                  buildVSpacer(10),
                  _buildTextHeader(
                      title: 'Sujan', fontWeight: FontWeight.w500, size: 13),
                  buildVSpacer(5),
                  _buildTextHeader(
                      title: 'Security Supervisor',
                      fontWeight: FontWeight.w500,
                      size: 13,
                      color: Colors.red),
                  buildVSpacer(5),
                  _buildTextHeader(
                      title: 'Sujan@gmail.com',
                      fontWeight: FontWeight.w500,
                      size: 13),
                  buildVSpacer(500),
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
