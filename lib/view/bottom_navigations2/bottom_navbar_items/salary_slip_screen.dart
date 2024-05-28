import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/payslip_screen/payslip_screen.dart';

class SalarySlipScreen2 extends StatefulWidget {
  const SalarySlipScreen2({super.key});

  @override
  State<SalarySlipScreen2> createState() => _SalarySlipScreen2State();
}

class _SalarySlipScreen2State extends State<SalarySlipScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            buildVSpacer(20),
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
                      buildHSpacer(130),
                      Center(child: Image.asset("assets/icon_small.png"))
                    ],
                  ),
                ),
              ],
            ),
            buildVSpacer(50),
            _buildText(title: "Salary Slips :"),
            Card(
              elevation: 5,
              child: Container(
                // height: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            _buildText(title: "S.no"),
                            buildHSpacer(50),
                            _buildText(title: "Salary Slip Date"),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      buildVSpacer(20),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaySlipScreen(),
                              ),
                            );
                          },
                          child: Image.asset("assets/sal.png")),
                      buildVSpacer(20),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaySlipScreen(),
                              ),
                            );
                          },
                          child: Image.asset("assets/sal.png")),
                      buildVSpacer(20),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaySlipScreen(),
                              ),
                            );
                          },
                          child: Image.asset("assets/sal.png")),
                      buildVSpacer(20),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaySlipScreen(),
                              ),
                            );
                          },
                          child: Image.asset("assets/sal.png")),
                      buildVSpacer(40),
                    ],
                  ),
                ),
              ),
            ),
            buildVSpacer(60),
            _buildTextHeader(
                title:
                    "Note : You can view and download only last 3 months salary slips..")
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
      horizontal: 0.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}
