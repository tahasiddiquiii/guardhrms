import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/map_screen/map_screen.dart';
import 'package:security_app/view/mapped_site_details/mapped_site_details_screen2.dart';

class LateDetailsScreen extends StatefulWidget {
  const LateDetailsScreen({super.key});

  @override
  State<LateDetailsScreen> createState() => _LateDetailsScreenState();
}

class _LateDetailsScreenState extends State<LateDetailsScreen> {
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
                        title: "Late Details",
                        fontWeight: FontWeight.bold,
                        size: 16),
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: buildCustomTextField1(
                  hintText: "Search Sites", prefixIcon: Icon(Icons.search))),
          buildVSpacer(20),
          _buildText(title: "Site 01", size: 16, fontWeight: FontWeight.bold),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildText(title: "Supervisor"),
                                  _buildText(title: ":"),
                                  _buildText(title: "02")
                                ],
                              ),
                              buildVSpacer(20),
                              Row(
                                children: [
                                  _buildText(title: "Total Guards"),
                                  _buildText(title: ":"),
                                  _buildText(title: "10")
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                // Showing the success dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SuccessDialog(); // Using the custom dialog widget
                                  },
                                );
                              },
                              child: Image.asset("assets/scanner.png"))
                        ],
                      ),
                    ),
                    buildVSpacer(30),
                    Row(
                      children: [
                        _buildText(title: "Location"),
                        _buildText(title: ":"),
                        Flexible(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapScreen()));
                          },
                          child: _buildText(
                              title:
                                  "Symboilc Apartments 34-B, Noida Uttar pradesh , India."),
                        ))
                      ],
                    ),
                    buildVSpacer(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomButton(
                          text: "See More Details",
                          height: 40,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MappedSiteDetailsScreen2()));
                          }),
                    ),
                    buildVSpacer(15),
                  ],
                ),
              ),
            ),
          ),
          buildVSpacer(20),
          _buildText(title: "Site 02", size: 16, fontWeight: FontWeight.bold),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildText(title: "Supervisor"),
                                  _buildText(title: ":"),
                                  _buildText(title: "02")
                                ],
                              ),
                              buildVSpacer(20),
                              Row(
                                children: [
                                  _buildText(title: "Total Guards"),
                                  _buildText(title: ":"),
                                  _buildText(title: "10")
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                // Showing the success dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SuccessDialog(); // Using the custom dialog widget
                                  },
                                );
                              },
                              child: Image.asset("assets/scanner.png"))
                        ],
                      ),
                    ),
                    buildVSpacer(30),
                    Row(
                      children: [
                        _buildText(title: "Location"),
                        _buildText(title: ":"),
                        Flexible(
                            child: _buildText(
                                title:
                                    "Symboilc Apartments 34-B, Noida Uttar pradesh , India."))
                      ],
                    ),
                    buildVSpacer(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomButton(
                          text: "See More Details",
                          height: 40,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MappedSiteDetailsScreen2()));
                          }),
                    ),
                    buildVSpacer(15),
                  ],
                ),
              ),
            ),
          ),
          buildVSpacer(50),
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
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
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
        GestureDetector(
            onTap: () async {
              // Showing the success dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog2(); // Using the custom dialog widget
                },
              );

              // Waiting for 5 seconds
              await Future.delayed(const Duration(seconds: 5));

              // Closing the dialog
              Navigator.pop(context); // Close the success dialog

              // Navigating to the next screen (replace `SignUpScreen1` with your actual next screen widget)
              Navigator.pop(context); // Close the success dialog
            },
            child: Image.asset('assets/scanner_box.png')),
      ],
    );
  }
}

class SuccessDialog2 extends StatelessWidget {
  const SuccessDialog2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/scanner_sucess.png'),
      ],
    );
  }
}
