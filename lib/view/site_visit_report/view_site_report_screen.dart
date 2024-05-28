import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/sign_up/sign_up_screen1.dart';

class ViewSiteReportScreen extends StatefulWidget {
  const ViewSiteReportScreen({super.key});

  @override
  State<ViewSiteReportScreen> createState() => _ViewSiteReportScreenState();
}

class _ViewSiteReportScreenState extends State<ViewSiteReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: CustomButton(
            text: "Back",
            onPressed: () async {
              Navigator.pop(context); // Close the success dialog
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVSpacer(50),
              Center(child: Image.asset("assets/icon_small.png")),
              buildVSpacer(30),
              _buildTextHeader(
                  title: "Site Visit Report",
                  fontWeight: FontWeight.bold,
                  size: 16),
              buildVSpacer(30),
              _buildText(title: "Total Guards at site"),
              buildCustomTextField1(hintText: "50"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Grooming Standards of Security Personnel"),
              buildVSpacer(20),
              _buildText(title: "(Rate 1 to 5 )", color: Colors.red),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3, // Set initial rating as required
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(
                            rating); // Handle the rating change, e.g., updating the state or storing in a variable
                      },
                    ),
                    _buildText(title: "4.5/5.0", size: 20, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Alertness Level of Security Personnel"),
              buildVSpacer(20),
              _buildText(title: "(Rate 1 to 5 )", color: Colors.red),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3, // Set initial rating as required
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(
                            rating); // Handle the rating change, e.g., updating the state or storing in a variable
                      },
                    ),
                    _buildText(title: "4.5/5.0", size: 20, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Supervisor Personnel Behaviour"),
              buildVSpacer(20),
              _buildText(title: "(Rate 1 to 5 )", color: Colors.red),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3, // Set initial rating as required
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(
                            rating); // Handle the rating change, e.g., updating the state or storing in a variable
                      },
                    ),
                    _buildText(title: "4.5/5.0", size: 20, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Maintainace of Records"),
              buildVSpacer(20),
              _buildText(title: "(Rate 1 to 5 )", color: Colors.red),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3, // Set initial rating as required
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(
                            rating); // Handle the rating change, e.g., updating the state or storing in a variable
                      },
                    ),
                    _buildText(title: "4.5/5.0", size: 20, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Whether any Security Threat observed"),
              buildCustomTextField1(hintText: "Loremipsum...."),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Any General Information About The Site"),
              buildCustomTextField1(hintText: "Loremipsum...."),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(20),
              _buildText(title: "Any Other Remarks"),
              buildCustomTextField1(hintText: "Loremipsum...."),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(text: "View Image", onPressed: () {}),
              ),
              buildVSpacer(50),
            ],
          ),
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
            fontWeight: fontWeight ??
                FontWeight
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
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
        Image.asset('assets/site_visit_report.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
