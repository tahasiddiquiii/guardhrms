import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/controller/add_employee_controller.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';

import '../custom_widgets/custom_long_button.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({super.key});

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  final addEmployeeController = Get.put(AddEmployeeController());

  TextEditingController nameController = TextEditingController();
  TextEditingController fatherHusbandController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dojController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emegencyNumberController = TextEditingController();
  TextEditingController aadharNumberController = TextEditingController();
  TextEditingController bankAccNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  TextEditingController siteCodeOrNameController = TextEditingController();

  void _validateAndSubmit() async {
    if (mobileController.text.isEmpty ||
        nameController.text.isEmpty ||
        fatherHusbandController.text.isEmpty ||
        emailController.text.isEmpty ||
        aadharNumberController.text.isEmpty ||
        bankAccNumberController.text.isEmpty ||
        ifscCodeController.text.isEmpty) {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill out all fields before submitting."),
        ),
      );
    } else {
      // Proceed with the API request
      addEmployeeController.addNewEmployee(
        context,
        mobileController.text,
        "AREAMANAGER",
        nameController.text,
        fatherHusbandController.text,
        emailController.text,
        aadharNumberController.text,
        bankAccNumberController.text,
        ifscCodeController.text,
      );

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SuccessDialog();
        },
      ).then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AppBottomNavBar3(
                    index: 0,
                  )),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: AnimatedContainer(
            width: addEmployeeController.isLoading.value == false
                ? MediaQuery.of(context).size.width
                : 60,
            duration: const Duration(milliseconds: 300),
            child: CustomLongButton(
                name: "Add",
                isLoading: addEmployeeController.isLoading.value,
                ontap: _validateAndSubmit),
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildVSpacer(50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          child: Icon(Icons.arrow_back_ios)),
                      buildHSpacer(100),
                      _buildTextHeader(
                          title: "Add New Employee",
                          fontWeight: FontWeight.bold,
                          size: 16),
                    ],
                  ),
                ),
              ],
            ),
            buildVSpacer(20),
            _buildText(
                title: "Personal Information",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Akash Apartments", controller: nameController),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Father/Husband Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: fatherHusbandController),
            ),
            buildVSpacer(20),
            _buildText(title: "DOB", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Akash Apartments", controller: dobController),
            ),
            buildVSpacer(20),
            _buildText(title: "DOJ", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: dojController),
            ),
            buildVSpacer(20),
            _buildText(title: "Email", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Akash Apartments", controller: emailController),
            ),
            buildVSpacer(20),
            _buildText(title: "Mobile", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: mobileController),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Emergency Contact Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: emegencyNumberController),
            ),
            buildVSpacer(20),
            _buildText(title: "Aadhar Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: aadharNumberController),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Bank Account Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: bankAccNumberController),
            ),
            buildVSpacer(20),
            _buildText(title: "IFSC Code Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: ifscCodeController),
            ),
            buildVSpacer(20),
            _buildText(title: "Current Address", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours", controller: currentAddressController),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Mapped Site Details",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Site Code/Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Hours",
                  controller: siteCodeOrNameController,
                  suffixIcon: Icon(Icons.arrow_drop_down)),
            ),
            buildVSpacer(20),
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
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
      horizontal: 18.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}

Widget _buildText1(
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
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
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
        Image.asset('assets/added_employee.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
