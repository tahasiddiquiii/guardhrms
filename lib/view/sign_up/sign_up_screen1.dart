import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/employee_details_screen/employee_details_screen1.dart';
import 'package:security_app/view/verify_otp/verifyOtp_screen1.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  bool _isAgreeToTerms = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            buildVSpacer(90),
            Image.asset('assets/icon.png'),
            buildVSpacer(60),
            Image.asset('assets/signup_1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  hintText: "Phone Number"),
            ),
            buildVSpacer(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VerifyOtpScreen(),
                      ),
                    );
                  }),
            ),
            buildVSpacer(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmployeeDetailScreen1(),
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
