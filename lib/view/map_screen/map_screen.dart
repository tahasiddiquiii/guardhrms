import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            buildVSpacer(20),
            _buildText(
                title: "Destination Location",
                size: 22,
                fontWeight: FontWeight.bold),
            buildVSpacer(20),
            _buildText(
                title: "Your Location",
                fontWeight: FontWeight.w500,
                color: Colors.grey),
            buildVSpacer(20),
            _buildText(title: "2972 Westheimer Rd. Santa Ana, Illinois 85486 "),
            buildVSpacer(20),
            _buildText(
                title: "Save As",
                fontWeight: FontWeight.w500,
                color: Colors.grey),
            buildVSpacer(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileCard(
                        boxId: 1,
                        title: 'Home',
                        imageUrl: 'assets/home1.png',
                      ),
                      buildHSpacer(20),
                      ProfileCard(
                        boxId: 1,
                        title: 'Office',
                        imageUrl: 'assets/office.png',
                      ),
                    ],
                  ),
                  buildVSpacer(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileCard(
                        boxId: 1,
                        title: 'Others',
                        imageUrl: 'assets/location.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child:
                    CustomButton(text: "Start Directions", onPressed: () {})),
          ],
        ),
      ),
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
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      buildHSpacer(100),
                      _buildTextHeader(
                          title: "Maps", fontWeight: FontWeight.bold, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset("assets/map.png"),
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
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}

class ProfileCard extends StatefulWidget {
  final int boxId;
  final String title;
  final String imageUrl;

  ProfileCard(
      {Key? key,
      required this.boxId,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isSelected = false; // State variable for selection status

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection state on tap
        });
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: 130,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: isSelected
                ? Colors.red
                : Colors.grey[200], // Change color based on selection
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imageUrl, // Access imageUrl via widget property
              ),
              SizedBox(
                  width:
                      10), // Replace buildHSpacer with SizedBox for simplicity
              Text(
                widget.title, // Access title via widget property
                style: TextStyle(
                  fontSize: 15.0,
                  color: isSelected
                      ? Colors.white
                      : Colors.black, // Change text color based on selection
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
