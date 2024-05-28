import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class PaySlipScreen extends StatefulWidget {
  const PaySlipScreen({super.key});

  @override
  State<PaySlipScreen> createState() => _PaySlipScreenState();
}

class _PaySlipScreenState extends State<PaySlipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Container(
            height: 200,
            child: Column(
              children: [
                CustomButton(
                  text: "Download",
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
                  },
                ),
                buildVSpacer(30),
                CustomButton(
                  text: "Back",
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )),
      body: Column(
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
          buildVSpacer(30),
          Image.asset('assets/payslip.png'),
        ],
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
        Image.asset('assets/pay_slip_download.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
