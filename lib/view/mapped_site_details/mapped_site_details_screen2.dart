import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/mapped_site_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MappedSiteDetailsScreen2 extends StatefulWidget {
  const MappedSiteDetailsScreen2({super.key});

  @override
  State<MappedSiteDetailsScreen2> createState() =>
      _MappedSiteDetailsScreen2State();
}

class _MappedSiteDetailsScreen2State extends State<MappedSiteDetailsScreen2> {
  Future<void> _setClickedTrue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('card_clicked', true);
    print(prefs);
  }

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
                        },
                        child: Icon(Icons.arrow_back_ios)),
                    buildHSpacer(100),
                    _buildTextHeader(
                        title: "Mapped Site Details",
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
            onTap: () async {
              await _setClickedTrue();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MappedProfileScreen()));
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
                            _buildText(
                                title: "Supervisors :",
                                fontWeight: FontWeight.bold),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
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
          buildVSpacer(30),
          GestureDetector(
            onTap: () async {
              await _setClickedTrue();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MappedProfileScreen()));
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
                            _buildText(
                                title: "Guards :", fontWeight: FontWeight.bold),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
                            buildVSpacer(20),
                            Row(
                              children: [
                                _buildText(title: "1 . Madhu Nandhan"),
                                Spacer(),
                                Image.asset('assets/icon_forward.png')
                              ],
                            ),
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
