import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/controller/auth_controller.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/employee_details_screen/employee_details_screen1.dart';
import 'package:security_app/view/employee_details_screen/employee_details_screen4.dart';
import 'package:security_app/view/verify_otp/verifyOtp_screen1.dart';
import 'package:security_app/view/verify_otp/verifyOtp_screen4.dart';

import '../custom_widgets/custom_long_button.dart';

class SignUpScreen4 extends StatefulWidget {
  final String? userType;
  const SignUpScreen4({super.key, this.userType});

  @override
  State<SignUpScreen4> createState() => _SignUpScreen4State();
}

class _SignUpScreen4State extends State<SignUpScreen4> {
  final authController = Get.put(AuthController());
  bool _isAgreeToTerms = false; // Checkbox state
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = "7983270589";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            buildVSpacer(90),
            Image.asset('assets/icon.png'),
            buildVSpacer(60),
            Image.asset('assets/signup_4.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  controller: phoneController,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  hintText: "Phone Number"),
            ),
            buildVSpacer(50),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AnimatedContainer(
                  width: authController.isLoading.value == false
                      ? MediaQuery.of(context).size.width
                      : 60,
                  duration: const Duration(milliseconds: 300),
                  child: CustomLongButton(
                      name: "Login",
                      isLoading: authController.isLoading.value,
                      ontap: () async {
                        await authController
                            .loginApi(
                                context, phoneController.text, widget.userType!)
                            .then((value) async {
                          authController.isLoginFail.value = false;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerifyOtpScreen4(),
                            ),
                          );
                          // Show Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Please verify your OTP: ${authController.authModel!.otp}'),
                            ),
                          );
                        }).catchError((error) {
                          // Show Snackbar for error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login failed: $error'),
                            ),
                          );
                        });
                      }),
                ),
              );
            }),
            buildVSpacer(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmployeeDetailScreen4(),
                      ),
                    );
                  }),
            ),
            buildVSpacer(50),
            CheckboxListTile(
              value: _isAgreeToTerms,
              onChanged: (bool? newValue) {
                setState(() {
                  _isAgreeToTerms = newValue ?? false;
                });
              },
              title: Text('I agree to the Terms & Conditions'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }
}
