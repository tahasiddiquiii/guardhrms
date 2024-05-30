import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:security_app/controller/site_list_report_controller.dart';
import 'package:security_app/models/site_list_report_model.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations3/bottom_nav_bar.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';
import 'package:security_app/view/map_screen/map_screen.dart';

class ReportScreen02 extends StatefulWidget {
  const ReportScreen02({super.key});

  @override
  State<ReportScreen02> createState() => _ReportScreen02State();
}

class _ReportScreen02State extends State<ReportScreen02> {
  final siteListReportController = Get.put(SiteListReportController());

  @override
  void initState() {
    super.initState();
    siteListReportController.getSiteVisitListReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return siteListReportController.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
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
                                        builder: (context) => AppBottomNavBar4(
                                              index: 0,
                                            )));
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          buildHSpacer(100),
                          _buildTextHeader(
                              title: "Site Visit Report",
                              fontWeight: FontWeight.bold,
                              size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
                buildVSpacer(20),
                Expanded(
                  child: ListView.builder(
                    itemCount: siteListReportController
                        .siteListReportModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Datum data = siteListReportController
                          .siteListReportModel!.data![index];
                      return _siteCard(context, index, data);
                    },
                  ),
                ),
              ],
            );
    }));
  }
}

Widget _siteCard(
  BuildContext context,
  int index,
  Datum data,
) {
  return Column(
    children: [
      _buildText(
          title: "Site 0${index + 1}", size: 16, fontWeight: FontWeight.bold),
      GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AppBottomNavBar3(
                          index: 3,
                        )));
          },
          child: Card(
            elevation: 5,
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildText(
                                      title: "Date of Visit :",
                                      fontWeight: FontWeight.bold),
                                  _buildText(
                                    title: DateFormat('dd-MM-yyyy').format(
                                      data.deploymentStart != null
                                          ? DateTime.parse(
                                              data.deploymentStart.toString())
                                          : DateTime.now(),
                                    ),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              buildVSpacer(20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MapScreen()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    _buildText(
                                        title: "Location :",
                                        fontWeight: FontWeight.bold),
                                    Flexible(
                                        child: _buildText1(
                                            title:
                                                "${data.clientName}, ${data.siteNameAndAddress}",
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              buildVSpacer(30),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 10),
                                  child: CustomButton(
                                    text: "View Report",
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const SuccessDialog(); // Using the custom dialog widget
                                        },
                                      );
                                      // Waiting for 5 seconds
                                      await Future.delayed(
                                          const Duration(seconds: 5));

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppBottomNavBar3(
                                                  index: 0,
                                                )),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ],

                      // buildVSpacer(30),
                    ))),
          ))
    ],
  );
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
        Image.asset('assets/sucess_approval.png'),
        // const SizedBox(height: 10),
        // const Text("Successfully Submitted the Request\nto change the data"),
      ],
    );
  }
}
