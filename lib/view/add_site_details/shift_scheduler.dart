import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';

class ShiftScheduler extends StatefulWidget {
  @override
  _ShiftSchedulerState createState() => _ShiftSchedulerState();
}

class _ShiftSchedulerState extends State<ShiftScheduler> {
  List<String> shifts = ['A', 'B', 'C'];
  bool canRemove =
      false; // To track if the last action was an addition (allows removal)

  void _updateShifts() {
    setState(() {
      if (canRemove && shifts.length > 3) {
        // Allow removal only if there are more than 3 shifts
        shifts.removeLast();
      } else {
        // Assuming you only go up to 'Z'
        if (shifts.length < 26) {
          var nextShift = String.fromCharCode(shifts.last.codeUnitAt(0) + 1);
          shifts.add(nextShift);
        }
      }
      canRemove = !canRemove; // Toggle the ability to remove after adding
    });
  }

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
    return Column(
      children: <Widget>[
        for (String shift in shifts) ...[
          _buildText(
              title: "Shift-$shift (Starting Time)",
              fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(
                hintText: "$shift Starting Point",
                suffixIcon: Icon(Icons.calendar_month)),
          ),
          buildVSpacer(20),
          _buildText(
              title: "Shift-$shift (Ending Time)", fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: buildCustomTextField1(
              hintText: "$shift Ending Point",
              suffixIcon: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Icon(Icons.calendar_month)),
            ),
          ),
          buildVSpacer(20),
        ],
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: CustomButton(
              text: canRemove ? "Remove" : "Add More Shifts",
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
