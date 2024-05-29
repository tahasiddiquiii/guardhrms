import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';

import '../../../controller/leave_controller.dart';
import '../../custom_widgets/custom_long_button.dart'; // For date formatting

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplyLeaveScreen4 extends StatefulWidget {
  const ApplyLeaveScreen4({super.key});

  @override
  State<ApplyLeaveScreen4> createState() => _ApplyLeaveScreen4State();
}

class _ApplyLeaveScreen4State extends State<ApplyLeaveScreen4> {
  final leaveController = Get.put(LeaveController());
  DateTime? _fromDate;
  DateTime? _toDate;

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isFromDate ? _fromDate ?? DateTime.now() : _toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
          fromDateController.text = DateFormat('yyyy-MM-dd').format(picked);
        } else {
          _toDate = picked;
          toDateController.text = DateFormat('yyyy-MM-dd').format(picked);
        }
      });
    }
  }

  void _validateAndSubmit() async {
    if (fromDateController.text.isEmpty ||
        toDateController.text.isEmpty ||
        reasonController.text.isEmpty) {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill out all fields before submitting."),
        ),
      );
    } else {
      // Proceed with the API request
      leaveController.requestLeave(
        context,
        fromDateController.text,
        toDateController.text,
        reasonController.text,
      );

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SuccessDialog();
        },
      ).then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AppBottomNavBar4(index: 0),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
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
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      SizedBox(width: 130),
                      Center(child: Image.asset("assets/icon_small.png")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildTextHeader(
                title: "Request For Leave !!", fontWeight: FontWeight.bold),
            SizedBox(height: 15),
            _buildText(title: "From"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                controller: fromDateController,
                hintText: _fromDate == null
                    ? 'Select date'
                    : DateFormat('yyyy-MM-dd').format(_fromDate!),
                suffixIcon: GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: Icon(Icons.calendar_month),
                ),
              ),
            ),
            _buildText(title: "To"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                controller: toDateController,
                hintText: _toDate == null
                    ? 'Select date'
                    : DateFormat('yyyy-MM-dd').format(_toDate!),
                suffixIcon: GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: Icon(Icons.calendar_month),
                ),
              ),
            ),
            _buildText(title: "Reason"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                controller: reasonController,
                hintText: "Enter the reason for leave...",
                inputContainerHeight: 120,
              ),
            ),
            SizedBox(height: 50),
            Obx(() {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: AnimatedContainer(
                  width: leaveController.isLoading.value == false
                      ? MediaQuery.of(context).size.width
                      : 60,
                  duration: const Duration(milliseconds: 300),
                  child: CustomLongButton(
                    name: "Send Request",
                    isLoading: leaveController.isLoading.value,
                    ontap: _validateAndSubmit,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHeader({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size ?? 24, // Increased size for headers
            fontWeight: fontWeight ?? FontWeight.bold, // Defaulted to bold
            fontFamily: 'Poppins',
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildText({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: size ?? 16, // Adjusted size
            fontWeight: fontWeight ?? FontWeight.normal,
            fontFamily: 'Poppins',
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
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
        Image.asset('assets/leave_approval.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
