import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class AddShifts extends StatefulWidget {
  @override
  _AddShiftsState createState() => _AddShiftsState();
}

class _AddShiftsState extends State<AddShifts> {
  List<String> shifts = ['A', 'B', 'C'];
  bool canRemove =
      false; // To track if the last action was an addition (allows removal)

  void _updateShifts() {
    setState(() {
      if (canRemove && shifts.length > 3) {
        shifts.removeLast();
      } else {
        // Assuming you only go up to 'Z'
        if (shifts.length < 26) {
          var nextShift = String.fromCharCode(shifts.last.codeUnitAt(0) + 1);
          shifts.add(nextShift);
        }
      }
      canRemove = !canRemove;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (String shift in shifts) ...[
          _buildText(title: "Shift-$shift", fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(
              hintText: "$shift Starting Point",
            ),
          ),
          buildVSpacer(20),
        ],
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        //   child: ElevatedButton(
        //     onPressed: _updateShifts,
        //     child: Text(canRemove ? "Remove" : "Add More Shifts"),
        //   ),
        // ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: CustomButton(
              text: canRemove ? "Remove" : "Add More",
              onPressed: () async {
                _updateShifts();
              },
            )),

        buildVSpacer(20),
      ],
    );
  }
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
