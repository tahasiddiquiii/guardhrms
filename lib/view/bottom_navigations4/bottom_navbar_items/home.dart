import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations4/bottom_nav_bar.dart';
import 'package:security_app/view/double_duty_screen/double_duty_screen.dart';
import 'package:security_app/view/early_checkOut_screen/early_checkOut_screen.dart';
import 'package:security_app/view/late_screen/late_screen.dart';
import 'package:security_app/view/man_days_required_screen/man_days_required_screen.dart';
import 'package:security_app/view/map_screen/map_screen.dart';
import 'package:security_app/view/mapped_site_details/mapped_site_details_screen.dart';
import 'package:security_app/view/present_screen/present_screen.dart';
import 'package:security_app/view/request_for_regularization/request_for_regularization.dart';
import 'package:security_app/view/request_for_regularization/request_for_regularization02.dart';
import 'package:security_app/view/shortage_details_screen/shortage_details_screen.dart';
import 'package:security_app/view/site_visit_report/site_visit_report_screen.dart';
import 'package:security_app/view/total_deployment_details_screen/total_deployment_details_screen.dart';
import 'package:security_app/view/unMapped_site_screen/unmapped_site_screen.dart';

class Home4 extends StatefulWidget {
  const Home4({super.key});

  @override
  State<Home4> createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  String buttonText = "Check-In";
  String? checkInTime;
  bool isCheckedIn = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        // appBar: ,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 70),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset('assets/menu.png'),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icon_small.png',
                      scale: 0.9,
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AppBottomNavBar4(
                                index: 3,
                              ),
                            ),
                          );
                        },
                        child: Image.asset('assets/profile_small.png')),
                  ],
                ),
              ),
              buildVSpacer(20),
              _buildTextHeader(title: 'Duty Details', size: 16),
              Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _buildTextHeader(
                                title: "Role", fontWeight: FontWeight.bold),
                            buildHSpacer(42),
                            _buildTextHeader(title: ":"),
                            _buildTextHeader(
                                title: "Branch Head / Regional Head"),
                          ],
                        ),
                        buildVSpacer(15),
                        Row(
                          children: [
                            _buildTextHeader(
                                title: "Status", fontWeight: FontWeight.bold),
                            buildHSpacer(30),
                            _buildTextHeader(title: ":"),
                            _buildTextHeader(
                                title: isCheckedIn ? "On Duty" : "Off Duty",
                                color: isCheckedIn ? Colors.green : Colors.red),
                          ],
                        ),
                        buildVSpacer(15),
                        if (checkInTime != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    _buildTextHeader(
                                      title: "Check-In Time    : ",
                                    ),
                                    _buildTextHeader(
                                      title: "09:00 AM",
                                    ),
                                  ],
                                ),
                                buildVSpacer(15),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MapScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      _buildTextHeader(
                                        title: "Location              : ",
                                      ),
                                      Flexible(
                                          child: _buildTextHeader(
                                        title:
                                            "Symboilc Apartments 34-B, NoidaUttar pradesh , India.",
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        buildVSpacer(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            child: Text(
                              buttonText,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                if (!isCheckedIn) {
                                  checkInTime = DateTime.now().toString();
                                  buttonText = "Check-Out";
                                  isCheckedIn = true;
                                } else {
                                  checkInTime = null;
                                  buttonText = "Check-In";
                                  isCheckedIn = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF02946),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: Size(double.infinity,
                                  40), // expands to fit the horizontal space
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildVSpacer(20),
              _buildTextHeader(title: 'Pin Site Visit', size: 16),
              buildVSpacer(20),
              Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomButton(
                              text: "Visit Site",
                              height: 40,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SiteVisitReportScreen()));
                              }),
                        ),
                        buildVSpacer(15),
                      ],
                    ),
                  ),
                ),
              ),
              buildVSpacer(20),
              _buildTextHeader(title: 'Mapped Site’s', size: 16),
              buildVSpacer(20),
              Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                _buildTextHeader(
                                    title: "Total Sites", size: 16),
                                buildVSpacer(10),
                                _buildTextHeader(
                                    title: "50", color: Colors.red, size: 16)
                              ],
                            ),
                            buildHSpacer(60),
                            Column(
                              children: [
                                _buildTextHeader(
                                    title: "Total Guards", size: 16),
                                buildVSpacer(10),
                                _buildTextHeader(
                                    title: "250", color: Colors.red, size: 16)
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomButton(
                              text: "View-All",
                              height: 40,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MappedSiteDetailsScreen()));
                              }),
                        ),
                        buildVSpacer(15),
                      ],
                    ),
                  ),
                ),
              ),
              buildVSpacer(30),
              buildVSpacer(20),
              _buildTextHeader(title: 'Daily Deployment', size: 16),
              buildVSpacer(20),
              Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TotalDeploymentDetailsScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "Total\nDeployment", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PresentDetailsScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(title: "Present", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShortageDetailsScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(title: "Shortage", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DoubleDutyScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(title: "Double\nDuty", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UnMappedDiteDetailsScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "UnMapped\nSite", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LateDetailsScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "05", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(title: "Late", size: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EarlyCheckOutScreen()));
                                },
                                child: Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "14", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "EarlyCheck\nOut", size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          buildVSpacer(15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              buildVSpacer(20),
              _buildTextHeader(title: 'Monthly Deployment', size: 16),
              buildVSpacer(20),
              Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ManDaysRequiredScreen()));
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "Man Days\nRequired", size: 16),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(title: "Duties\nDone", size: 16),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "Short Man\nDays", size: 16),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _buildTextHeader(
                                        title: "50", size: 16, hasBorder: true),
                                    buildVSpacer(10),
                                    _buildText(
                                        title: "Stability\nCoefficient",
                                        size: 16),
                                  ],
                                ),
                              ],
                            ),
                            buildVSpacer(15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              buildVSpacer(30),
              _buildTextHeader(title: 'Daily Attendance :', size: 16),
              widgetCal()
            ],
          ),
        ),
      );
    });
  }

  Widget widgetCal() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                title: Row(
                  children: [
                    Text(
                      "Daily Attendance Details :",
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/close.png'))
                  ],
                ),
                content: Container(
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildTextHeader(title: "Duty Hrs"),
                          buildHSpacer(20),
                          Text(":"),
                          buildHSpacer(20),
                          Text("8 Hours"),
                        ],
                      ),
                      buildVSpacer(20),
                      Row(
                        children: [
                          _buildTextHeader(title: "Check-In"),
                          buildHSpacer(20),
                          Text(":"),
                          buildHSpacer(20),
                          Text("9 : 00 AM"),
                        ],
                      ),
                      buildVSpacer(20),
                      Row(
                        children: [
                          _buildTextHeader(title: "Check-Out"),
                          buildHSpacer(20),
                          Text(":"),
                          buildHSpacer(20),
                          Text("9 : 00 PM"),
                        ],
                      ),
                      buildVSpacer(20),
                      Row(
                        children: [
                          _buildTextHeader(title: "Location"),
                          buildHSpacer(20),
                          Text(":"),
                          buildHSpacer(20),
                          Flexible(
                              child: Text(
                                  "Symboilc Apartments 34-B, Noida\nUttar pradesh , India.(Mapped)")),
                        ],
                      ),
                      buildVSpacer(30),
                      _buildText(
                          title:
                              "Note : After 48 Hrs not able to request the attendence regularization,",
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomButton(
                        text: "Request for regularization",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  RequestForRegularisationScreen02(),
                            ),
                          );
                        }),
                  ),
                ],
              );
            },
          );
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          if (day.day == 15) {
            return Center(
              child: Icon(Icons.local_airport),
            );
          } else {
            return null;
          }
        },
        weekFormat: false,
        height: 420.0,
        daysHaveCircularBorder: true,
      ),
    );
  }
}

Widget _buildTextHeader(
    {required String title,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    bool hasBorder = false}) {
  Widget textWidget = Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
            color: color ?? Colors.black),
      ),
    ),
  );

  if (hasBorder) {
    return Container(
      padding: EdgeInsets.all(10), // Adjust padding to fit your design
      decoration: BoxDecoration(
        color: Colors.white, // Optional: change background color
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.red, // Border color
          width: 2, // Border width
        ),
      ),
      child: textWidget,
    );
  }

  return textWidget;
}

Widget _buildText(
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
