import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations2/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';

import '../../controller/auth_controller.dart';
import '../custom_widgets/custom_long_button.dart';

class VerifyOtpScreen4 extends StatefulWidget {
  final String? phoneNumber;
  const VerifyOtpScreen4({super.key, this.phoneNumber});

  @override
  State<VerifyOtpScreen4> createState() => _VerifyOtpScreen4State();
}

String maskPhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 10) {
    throw ArgumentError('Phone number must be 10 digits long');
  }

  String start = phoneNumber.substring(0, 3);
  String end = phoneNumber.substring(7);

  return '$start****$end';
}

class _VerifyOtpScreen4State extends State<VerifyOtpScreen4> {
  String otps = '';
  OtpFieldController otpController = OtpFieldController();
  final authController = Get.put(AuthController());

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
                  'Enter the 4 digit code that we just sent to\n${maskPhoneNumber(widget.phoneNumber!)}',
              fontWeight: FontWeight.w400),
          buildVSpacer(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OTPTextField(
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: const Color(0xFFDDDDDD),
                ),
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {
                  otps = pin;
                  print("Changed: " + otps);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
          ),
          buildVSpacer(30),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: AnimatedContainer(
                width: authController.isLoading.value == false
                    ? MediaQuery.of(context).size.width
                    : 60,
                duration: const Duration(milliseconds: 300),
                child: CustomLongButton(
                  name: "Verify OTP",
                  isLoading: authController.isLoading.value,
                  ontap: () async {
                    // Call verifyOtp function to verify OTP
                    await authController.verifyOtp(
                      context,
                      otps, // Assuming this is how you get the OTP value
                    );

                    // Check if verifyOtpModel is not null and status is true
                    if (authController.verifyOtpModel != null &&
                        authController.verifyOtpModel!.status == 200) {
                      // If OTP is verified successfully, navigate to the next page
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => AppBottomNavBar4(
                              index: 0,
                            ),
                          ),
                          (route) => false);

                      // Show success Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Login Successful'),
                        ),
                      );
                    } else {
                      // If OTP verification fails or verifyOtpModel is null, show error Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Incorrect OTP. Please try again.'),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //   child: CustomButton(
          //       text: "Verify OTP",
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => AppBottomNavBar4(
          //               index: 0,
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          buildVSpacer(20),
          Obx(() {
            return Visibility(
              visible: authController.isLoading.value == true ? false : true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AnimatedContainer(
                  width: authController.isLoading.value == false
                      ? MediaQuery.of(context).size.width
                      : 60,
                  duration: const Duration(milliseconds: 300),
                  child: CustomLongButton(
                    name: "Resend",
                    bgColor: Color(0xFFFfffff),
                    textColor: Colors.grey,
                    showborder: true,
                    isLoading: authController.isLoading.value,
                    ontap: () async {
                      // Call verifyOtp function to verify OTP
                      await authController.resendOtp();

                      // Check if verifyOtpModel is not null and status is true
                      if (authController.resendOtpModel != null &&
                          authController.resendOtpModel!.message != null) {
                        // Show success Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                '${authController.resendOtpModel!.message}: ${authController.resendOtpModel!.data} '),
                          ),
                        );
                      } else {
                        // If OTP verification fails or verifyOtpModel is null, show error Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('error occured: Please try again.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          }),
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //     child: SizedBox(
          //       width: double.infinity,
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.white,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(8.0),
          //               side: const BorderSide(color: Colors.grey, width: 2.0)),
          //         ),
          //         child: const Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Text(
          //             "Resend",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               color: Colors.grey,
          //               fontSize: 16.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          //     )
          //     // CustomButton(text: "", onPressed: ),
          //     ),
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
