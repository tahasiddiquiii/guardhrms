import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart'; // For date formatting

class ApplyLeaveScreen4 extends StatefulWidget {
  const ApplyLeaveScreen4({super.key});

  @override
  State<ApplyLeaveScreen4> createState() => _ApplyLeaveScreen4State();
}

class _ApplyLeaveScreen4State extends State<ApplyLeaveScreen4> {
  DateTime? _fromDate;
  DateTime? _toDate;

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
        } else {
          _toDate = picked;
        }
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
                hintText: "Enter the reason for leave...",
                inputContainerHeight: 120,
              ),
            ),
            SizedBox(height: 50),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: CustomButton(
                  text: "Send Request",
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AppBottomNavBar4(
                          index: 0,
                        ),
                      ),
                    );
                  },
                )),
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
