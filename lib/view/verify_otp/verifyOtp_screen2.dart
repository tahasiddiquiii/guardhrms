import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations2/bottom_nav_bar.dart';

class VerifyOtpScreen2 extends StatefulWidget {
  const VerifyOtpScreen2({super.key});

  @override
  State<VerifyOtpScreen2> createState() => _VerifyOtpScreen2State();
}

class _VerifyOtpScreen2State extends State<VerifyOtpScreen2> {
  String otps = '';
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildVSpacer(80),
          Image.asset('assets/icon.png'),
          buildVSpacer(30),
          _buildTextHeader(
              title: 'Enter the code', fontWeight: FontWeight.bold, size: 22),
          buildVSpacer(20),
          _buildTextHeader(
              title:
                  'Enter the 4 digit code that we just sent to\n670******909',
              fontWeight: FontWeight.w400),
          buildVSpacer(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OTPTextField(
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Color(0xFFDDDDDD),
                ),
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  otps = pin;
                  print("Changed: " + otps);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
          ),
          buildVSpacer(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomButton(
                text: "Verify OTP",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppBottomNavBar2(
                        index: 0,
                      ),
                    ),
                  );
                }),
          ),
          buildVSpacer(20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.grey, width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Resend",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
              // CustomButton(text: "", onPressed: ),
              ),
          buildVSpacer(90),
        ],
      ),
    );
  }
}

Widget _buildTextHeader({
  required String title,
  double? size,
  FontWeight? fontWeight, // Added fontWeight parameter
}) {
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
        ),
      ),
    ),
  );
}
