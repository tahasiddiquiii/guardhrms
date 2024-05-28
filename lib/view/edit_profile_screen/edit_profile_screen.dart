import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 300,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          title: Center(
              child: Column(
            children: [
              Image.asset(
                "assets/icon_small.png",
                height: 50,
                scale: 0.1,
              ),
              buildVSpacer(20),
              _buildTextHeader(
                  title: "My Profile",
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  size: 18),
              buildVSpacer(30),
              Image.asset("assets/profile.png"),
            ],
          )), // Specify a height if needed
          // Ensure the title remains centered even when the back button is visible
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: CustomButton(
              text: "Update Profile",
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
                Navigator.pop(context); // Close the success dialog
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildText(title: "Name", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
                  title: "Pf No/ Employee ID", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your Last Name"),
              ),
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
                  title: "Father/Husband Name", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your Email ID"),
              ),
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
              _buildText(title: "DOB", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "DOJ", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "Email", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "Mobile", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
                  title: "Emergency Contact Number",
                  fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "Aadhar Number", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
                  title: "Bank Account Number", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "IFSC Code", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "UAN No", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "ESI No", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
              _buildText(title: "Current Address", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
            ],
          ),
        ));
  }
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

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/update_profile.png'),
      ],
    );
  }
}
