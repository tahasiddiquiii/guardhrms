import 'package:flutter/material.dart';

class CustomLongButton extends StatelessWidget {
  final void Function()? ontap;
  final String name;
  final Color? bgColor;
  final Color? textColor;

  bool showborder;
  bool? isLoading;
  CustomLongButton(
      {super.key,
      required this.ontap,
      required this.name,
      this.isLoading = false,
      this.showborder = false,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(bgColor ?? Color(0xFFF02946)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            // ignore: prefer_const_constructors

            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          ),
          shape: (isLoading != null && isLoading == true)
              ? MaterialStateProperty.all(const CircleBorder())
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  showborder
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0))
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                ),
        ),
        child: (isLoading != null && isLoading == true)
            ? SizedBox(
                // height: 35,
                // width: 70,
                child: Center(child: CircularProgressIndicator()))
            : FittedBox(
                child: Text(
                  name,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
