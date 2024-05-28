import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/sign_up/sign_up_screen1.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  void _showUploadBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      backgroundColor: Colors.red,
      builder: (context) {
        return Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Upload the documents',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/camera.png'),
                          color: Colors.red,
                        ),
                        buildHSpacer(10),
                        Text(
                          'Click',
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/gallery.png'),
                          color: Colors.red,
                        ),
                        buildHSpacer(10),
                        Text(
                          'Gallery',
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen1()),
              );
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildVSpacer(80),
            Image.asset('assets/icon_small.png'),
            buildVSpacer(30),
            _buildTextHeader(
                title: 'Request to change',
                fontWeight: FontWeight.bold,
                size: 18,
                color: Colors.red),
            buildVSpacer(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  _buildText(title: "Name", fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                      text: "Upload Supporting Document",
                      onPressed: () {
                        _showUploadBottomSheet();
                      },
                    ),
                  ),
                  buildVSpacer(10),
                  _buildText(
                      title: "Father/Husband Name",
                      fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                        text: "Upload Supporting Document",
                        onPressed: () {
                          _showUploadBottomSheet();
                        }),
                  ),
                  buildVSpacer(10),
                  _buildText(title: "Email", fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                      text: "Upload Supporting Document",
                      onPressed: () {
                        _showUploadBottomSheet();
                      },
                    ),
                  ),
                  buildVSpacer(10),
                  _buildText(title: "Aadhaar", fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                        text: "Upload Supporting Document",
                        onPressed: () {
                          _showUploadBottomSheet();
                        }),
                  ),
                  buildVSpacer(10),
                  _buildText(
                      title: "Bank Account", fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                        text: "Upload Supporting Document",
                        onPressed: () {
                          _showUploadBottomSheet();
                        }),
                  ),
                  buildVSpacer(10),
                  _buildText(title: "IFSC Code", fontWeight: FontWeight.bold),
                  buildCustomTextField1(hintText: "Enter text"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                        text: "Upload Supporting Document",
                        onPressed: () {
                          _showUploadBottomSheet();
                        }),
                  ),
                  buildVSpacer(10),
                ],
              ),
            ),
            buildVSpacer(30),
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
      horizontal: 0.0,
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
