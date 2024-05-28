import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class RequestForRegularisationScreen02 extends StatefulWidget {
  const RequestForRegularisationScreen02({super.key});

  @override
  State<RequestForRegularisationScreen02> createState() =>
      _RequestForRegularisationScreen02State();
}

class _RequestForRegularisationScreen02State
    extends State<RequestForRegularisationScreen02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: CustomButton(
            text: "Submit",
            onPressed: () async {
              // Showing the success dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog(); // Using the custom dialog widget
                },
              );

              // Waiting for 5 seconds
              await Future.delayed(const Duration(seconds: 5));

              // Closing the dialog
              Navigator.pop(context); // Close the success dialog

              // Navigating to the next screen (replace `SignUpScreen1` with your actual next screen widget)
              Navigator.pop(context); // Close the success dialog
              Navigator.pop(context); // Close the success dialog
            },
          )),
      body: Column(
        children: [
          buildVSpacer(20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios)),
                buildHSpacer(100),
                Center(child: Image.asset("assets/icon_small.png"))
              ],
            ),
          ),
          buildVSpacer(50),
          _buildTextHeader(
              title: 'Request for regularization',
              color: Colors.red,
              fontWeight: FontWeight.bold,
              size: 18),
          buildVSpacer(20),
          _buildText(title: "Revise Check-In Timings"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(hintText: "_:_:_Hrs"),
          ),
          buildVSpacer(20),
          _buildText(title: "Revise Check- Out Timings"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(hintText: "_:_:_Hrs"),
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
            fontWeight: fontWeight ?? FontWeight.w500,
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
        Image.asset('assets/sucess.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
