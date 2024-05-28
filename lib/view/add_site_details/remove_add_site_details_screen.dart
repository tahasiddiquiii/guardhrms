import 'package:flutter/material.dart';
import 'package:security_app/view/add_site_details/add_shits.dart';
import 'package:security_app/view/add_site_details/add_site_details_screen.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';

import 'shift_scheduler.dart';

class RemoveAddSiteDetailsScreen extends StatefulWidget {
  const RemoveAddSiteDetailsScreen({super.key});

  @override
  State<RemoveAddSiteDetailsScreen> createState() =>
      _RemoveAddSiteDetailsScreenState();
}

class _RemoveAddSiteDetailsScreenState
    extends State<RemoveAddSiteDetailsScreen> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Consider the initial date
      firstDate: DateTime(2000), // Starting date range
      lastDate: DateTime(2100), // Ending date range
    );
    if (picked != null) {
      // Do something with the date chosen
      print('Date Selected: ${picked.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: CustomButton(
            text: "Add",
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog(); // Using the custom dialog widget
                },
              );
              // Waiting for 5 seconds
              await Future.delayed(const Duration(seconds: 5));

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AppBottomNavBar3(
                          index: 0,
                        )),
              );
            },
          )),
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
                          title: "Add Sites Details",
                          fontWeight: FontWeight.bold,
                          size: 16),
                    ],
                  ),
                ),
              ],
            ),
            buildVSpacer(20),
            _buildText(
                title: "New Site Details",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Client Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Site Name and Address", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "Site Code", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(title: "State", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            buildVSpacer(20),
            _buildText(title: "City", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Akash Apartments"),
            ),
            buildVSpacer(20),
            _buildText(title: "Site Type", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(hintText: "Hours"),
            ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-A (Starting TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-A (Ending TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-B (Starting TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-B (Ending TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-C (Starting TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // _buildText(title: "Shift-C (Ending TIme)", fontWeight: FontWeight.bold),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: buildCustomTextField1(hintText: "Akash Apartments", suffixIcon: Icon(Icons.calendar_month)),
            // ),
            // buildVSpacer(20),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            //     child:CustomButton(
            //       text: "Add More Shifts",
            //       onPressed: () async {},
            //     )
            // ),
            // buildVSpacer(20),
            ShiftScheduler(),
            _buildText(title: "Select Role", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Total Deployment", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-A", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-B", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-C", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-D", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            // AddShifts(),
            buildVSpacer(20),
            _buildText(title: "Select Role", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Total Deployment", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-A", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-B", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-C", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(title: "Shift-D", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            // AddShifts(),
            buildVSpacer(20),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: CustomButton(
                  text: "Remove",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSiteDetailsScreen()));
                  },
                )),
            buildVSpacer(20),

            _buildText(
                title: "Start Date of Deployment", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Akash Apartments",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Icon(Icons.calendar_month))),
            ),

            buildVSpacer(20),
            _buildText(
                title: "End Date of Deployment", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                  hintText: "Akash Apartments",
                  suffixIcon: Icon(Icons.calendar_month)),
            ),
            buildVSpacer(20),
            _buildText(
                title: "Security In-charge Details",
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(
                title: "Level-0",
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Mobile Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Email-ID", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),

            buildVSpacer(20),
            _buildText(
                title: "Level-1",
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.red),
            buildVSpacer(20),
            _buildText(title: "Name", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Mobile Number", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
            buildVSpacer(20),
            _buildText(title: "Email-ID", fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: buildCustomTextField1(
                hintText: "Akash Apartments",
              ),
            ),
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
        Image.asset('assets/success_new_site.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
