import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

import '../../controller/regularization_controller.dart';
import '../custom_widgets/custom_long_button.dart';

class RequestForRegularisationScreen02 extends StatefulWidget {
  final DateTime? selectedDate;
  const RequestForRegularisationScreen02({super.key, this.selectedDate});

  @override
  State<RequestForRegularisationScreen02> createState() =>
      _RequestForRegularisationScreen02State();
}

class _RequestForRegularisationScreen02State
    extends State<RequestForRegularisationScreen02> {
  final regularizationController = Get.put(RegularizationController());
  TextEditingController reviseCheckInTiming = TextEditingController();
  TextEditingController reviseCheckOutTiming = TextEditingController();

  void _validateAndSubmit() async {
    if (reviseCheckInTiming.text.isEmpty || reviseCheckOutTiming.text.isEmpty) {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill out all fields before submitting."),
        ),
      );
    } else {
      // Proceed with the API request
      regularizationController.requestRegularization(
        context,
        "${widget.selectedDate}T$reviseCheckInTiming",
        "${widget.selectedDate}T$reviseCheckOutTiming",
        "66543c0a85172db8017e322c",
      );

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SuccessDialog();
        },
      ).then((value) {
        // Navigating to the next screen (replace `SignUpScreen1` with your actual next screen widget)
        Navigator.pop(context);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: AnimatedContainer(
            width: regularizationController.isLoading.value == false
                ? MediaQuery.of(context).size.width
                : 60,
            duration: const Duration(milliseconds: 300),
            child: CustomLongButton(
              name: "Send Request",
              isLoading: regularizationController.isLoading.value,
              ontap: _validateAndSubmit,
            ),
          ),
        );
      }),
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
                    child: const Icon(Icons.arrow_back_ios)),
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
            child: buildCustomTextField1(
                hintText: "_:_:_Hrs", controller: reviseCheckInTiming),
          ),
          buildVSpacer(20),
          _buildText(title: "Revise Check- Out Timings"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(
                hintText: "_:_:_Hrs", controller: reviseCheckOutTiming),
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
