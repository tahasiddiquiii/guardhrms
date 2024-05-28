import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/bottom_navigations1/bottom_nav_bar.dart';
import 'package:security_app/view/request_for_regularization/request_for_regularization.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                              builder: (context) => AppBottomNavBar(
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
                            _buildTextHeader(title: "Security Guard"),
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
                                title: "Off Duty", color: Colors.red),
                          ],
                        ),
                        buildVSpacer(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomButton(
                              text: "Check-In",
                              height: 40,
                              onPressed: () {
                                // Declare a variable to track the selected hours
                                String selectedHours = '';
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(
                                                "Select Total Hours of Duty Today",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                      'assets/close.png'))
                                            ],
                                          ),
                                          content: Container(
                                            height: 90,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() =>
                                                          selectedHours =
                                                              "8 HRS");
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          selectedHours ==
                                                                  "8 HRS"
                                                              ? Colors.white
                                                              : Colors.black,
                                                      backgroundColor:
                                                          selectedHours ==
                                                                  "8 HRS"
                                                              ? Colors.red
                                                              : null,
                                                    ),
                                                    child: Text("8 HRS"),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() =>
                                                          selectedHours =
                                                              "9 HRS");
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          selectedHours ==
                                                                  "9 HRS"
                                                              ? Colors.white
                                                              : Colors.black,
                                                      backgroundColor:
                                                          selectedHours ==
                                                                  "9 HRS"
                                                              ? Colors.red
                                                              : null,
                                                    ),
                                                    child: Text("9 HRS"),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() =>
                                                          selectedHours =
                                                              "10 HRS");
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          selectedHours ==
                                                                  "10 HRS"
                                                              ? Colors.white
                                                              : Colors.black,
                                                      backgroundColor:
                                                          selectedHours ==
                                                                  "10 HRS"
                                                              ? Colors.red
                                                              : null,
                                                    ),
                                                    child: Text("10 HRS"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }),
                        ),
                        buildVSpacer(15),
                      ],
                    ),
                  ),
                ),
              ),
              buildVSpacer(30),
              // Image.asset("assets/cal.png")
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
                                  RequestForRegularisationScreen(),
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
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
