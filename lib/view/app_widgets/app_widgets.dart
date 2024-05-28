
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox buildVSpacer(double height) => SizedBox(height: height);

SizedBox buildHSpacer(double width) => SizedBox(width: width);

Container buildCustomTextField1({
  TextEditingController? controller,
  String? hintText,
  double? hMargin,
  double? vMargin,
  double? inputContainerHeight,
  bool? expands,
  Widget? suffixIcon,
  Widget? prefixIcon, // Added prefixIcon parameter
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: hMargin ?? 0, vertical: vMargin ?? 20),
    width: double.maxFinite,
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            height: inputContainerHeight ?? 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller ?? TextEditingController(),
                expands: expands ?? false,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: hintText ?? 'Enter Text',
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  suffixIcon: suffixIcon != null ? IconTheme(data: IconThemeData(), child: suffixIcon) : null, // Apply color to suffix icon
                  prefixIcon: prefixIcon != null ? IconTheme(data: IconThemeData(), child: prefixIcon) : null, // Apply color to prefix icon
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


Widget _buildTextHeader({
  required String title,
  double? size,
  FontWeight? fontWeight, // Added fontWeight parameter
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w500, // Use the provided fontWeight or default to FontWeight.w500
          fontFamily: 'Poppins',
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
        style: GoogleFonts.roboto(
            fontSize: size ?? 15,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? Colors.black),
        textAlign: TextAlign.center,
      ),
    ),
  );
}