import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/edit_profile_screen/edit_profile_screen.dart';

class MappedProfileScreen extends StatefulWidget {
  const MappedProfileScreen({super.key});

  @override
  State<MappedProfileScreen> createState() => _MappedProfileScreenState();
}

class _MappedProfileScreenState extends State<MappedProfileScreen> {
  late int _selectedIndex;

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
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(31),
              topRight: Radius.circular(31),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(31),
              topRight: Radius.circular(31),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBottomNavBar3(
                                    index: 0,
                                  )));
                    },
                    child: Column(
                      children: [
                        Icon(Icons.home),
                        Spacer(),
                        _buildTextHeader(title: "Home"),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBottomNavBar3(
                                    index: 1,
                                  )));
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/list.png"),
                        Spacer(),
                        _buildTextHeader(title: "Salary Slips"),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBottomNavBar3(
                                    index: 2,
                                  )));
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/slip.png"),
                        Spacer(),
                        _buildTextHeader(title: "Apply Leave"),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBottomNavBar3(
                                    index: 3,
                                  )));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/profi.png",
                          color: Colors.red,
                        ),
                        Spacer(),
                        _buildTextHeader(title: "Profile", color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
          fontSize: size ?? 12, // Increased size for headers
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
