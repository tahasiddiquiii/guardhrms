import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';

class ProfileUpdateRequestScreen02 extends StatefulWidget {
  const ProfileUpdateRequestScreen02({super.key});

  @override
  State<ProfileUpdateRequestScreen02> createState() =>
      _ProfileUpdateRequestScreen02State();
}

class _ProfileUpdateRequestScreen02State
    extends State<ProfileUpdateRequestScreen02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    builder: (context) => AppBottomNavBar4(
                                          index: 0,
                                        )));
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      buildHSpacer(100),
                      _buildTextHeader(
                          title: "Profile Update Request’s",
                          fontWeight: FontWeight.bold,
                          size: 16),
                    ],
                  ),
                ),
              ],
            ),
            buildVSpacer(20),
            Image.asset('assets/pro_update.png'),
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
