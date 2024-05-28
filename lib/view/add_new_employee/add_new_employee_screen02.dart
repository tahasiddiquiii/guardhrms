import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';

class AddNewEmployeeScreen02 extends StatefulWidget {
  const AddNewEmployeeScreen02({super.key});

  @override
  State<AddNewEmployeeScreen02> createState() => _AddNewEmployeeScreen02State();
}

class _AddNewEmployeeScreen02State extends State<AddNewEmployeeScreen02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: CustomButton(
            text: "Add",
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog();
                },
              );
              // Waiting for 5 seconds
              await Future.delayed(const Duration(seconds: 5));

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AppBottomNavBar3(
                          index: 0,
                        )),
              );
            },
          )),
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
                          title: "Add New Employee",
                          fontWeight: FontWeight.bold,
                          size: 16),
                    ],
                  ),
                ),
              ],
            ),
            buildVSpacer(20),
            _buildText(
                title: "Personal Information",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Father/Husband Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "DOB", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(title: "DOJ", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Email", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(title: "Mobile", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Emergency Contact Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Aadhar Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Bank Account Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "IFSC Code Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Current Address", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Mapped Site Details",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Site Code/Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", suffixIcon: Icon(Icons.arrow_drop_down)),
            ),
            buildVSpacer(20),
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
        Image.asset('assets/added_employee.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
