import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/edit_profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 300,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            // child: Align(
            //   alignment: Alignment.topLeft,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Icon(Icons.arrow_back_ios),
            //   ),
            // ),
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
              text: "Edit Profile",
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ),
                );
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
              _buildText(
                  title: "Pf No/ Employee ID", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your Last Name"),
              ),
              _buildText(
                  title: "Father/Husband Name", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your Email ID"),
              ),
              _buildText(title: "DOB", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "DOJ", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "Email", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "Mobile", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(
                  title: "Emergency Contact Number",
                  fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "Aadhar Number", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(
                  title: "Bank Account Number", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "IFSC Code", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "UAN No", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "ESI No", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
              _buildText(title: "Current Address", fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: buildCustomTextField1(hintText: "Enter your First Name"),
              ),
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
