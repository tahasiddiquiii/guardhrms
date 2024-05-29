import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/controller/profile_controller.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/edit_profile_screen/edit_profile_screen.dart';

class ProfileScreen4 extends StatefulWidget {
  const ProfileScreen4({super.key});

  @override
  State<ProfileScreen4> createState() => _ProfileScreen4State();
}

class _ProfileScreen4State extends State<ProfileScreen4> {
  final profileController = Get.put(ProfileController());
  TextEditingController nameController = TextEditingController();
  TextEditingController empIdController = TextEditingController();
  TextEditingController fatherHusbandController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dojController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emegencyNumberController = TextEditingController();
  TextEditingController aadharNumberController = TextEditingController();
  TextEditingController bankAccNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController uanNoController = TextEditingController();
  TextEditingController esiNoController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();

  getProfileDetailsData() async {
    await profileController.getProfileDetails();

    nameController.text =
        profileController.profileDetailsModel!.data!.fullName!;
    // empIdController.text = profileController.profileDetailsModel!.data!.!;
    fatherHusbandController.text =
        profileController.profileDetailsModel!.data!.fatherHusbandName!;
    // dobController.text = profileController.profileDetailsModel!.data!.!;
    // dojController.text = profileController.profileDetailsModel!.data!.!;
    emailController.text = profileController.profileDetailsModel!.data!.email!;
    mobileController.text =
        profileController.profileDetailsModel!.data!.mobileNumber!;
    // emegencyNumberController.text = profileController.profileDetailsModel!.data!.!;
    aadharNumberController.text =
        profileController.profileDetailsModel!.data!.aadhaar!;
    bankAccNumberController.text =
        profileController.profileDetailsModel!.data!.bankAccount!;
    ifscCodeController.text =
        profileController.profileDetailsModel!.data!.ifscCode!;
    // uanNoController.text = profileController.profileDetailsModel!.data!.!;
    // esiNoController.text = profileController.profileDetailsModel!.data!.!;
    // currentAddressController.text = profileController.profileDetailsModel!.data!.!;
  }

  @override
  void initState() {
    super.initState();
    getProfileDetailsData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => profileController.isLoading.value == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 300,
              leading: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
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
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          image: NetworkImage(profileController
                              .profileDetailsModel!.data!.profilePic!)),
                    ),
                  ),
                ],
              )), // Specify a height if needed
              // Ensure the title remains centered even when the back button is visible
              centerTitle: true,
            ),
            bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
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
                    child: buildCustomTextField1(
                        controller: nameController,
                        hintText: "Enter your First Name"),
                  ),
                  _buildText(
                      title: "Pf No/ Employee ID", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your Last Name",
                        controller: empIdController),
                  ),
                  _buildText(
                      title: "Father/Husband Name",
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your Email ID",
                        controller: fatherHusbandController),
                  ),
                  _buildText(title: "DOB", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: dobController),
                  ),
                  _buildText(title: "DOJ", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: dojController),
                  ),
                  _buildText(title: "Email", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: emailController),
                  ),
                  _buildText(title: "Mobile", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: mobileController),
                  ),
                  _buildText(
                      title: "Emergency Contact Number",
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: emegencyNumberController),
                  ),
                  _buildText(
                      title: "Aadhar Number", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: aadharNumberController),
                  ),
                  _buildText(
                      title: "Bank Account Number",
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: bankAccNumberController),
                  ),
                  _buildText(title: "IFSC Code", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: ifscCodeController),
                  ),
                  _buildText(title: "UAN No", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: uanNoController),
                  ),
                  _buildText(title: "ESI No", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: esiNoController),
                  ),
                  _buildText(
                      title: "Current Address", fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildCustomTextField1(
                        hintText: "Enter your First Name",
                        controller: currentAddressController),
                  ),
                ],
              ),
            )));
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
