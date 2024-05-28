import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/sign_up/sign_up_screen1.dart';
import 'package:security_app/view/sign_up/sign_up_screen2.dart';
import 'package:security_app/view/sign_up/sign_up_screen3.dart';
import 'package:security_app/view/sign_up/sign_up_screen4.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({Key? key}) : super(key: key);

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.asset('assets/select_profile.png'),
            ),
            buildVSpacer(30),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileCard(1, 'SG/ESG/LPA/LLPA/ACO', SignUpScreen1()),
                    buildHSpacer(30),
                    profileCard(2, 'Security Supervisor', SignUpScreen2()),
                  ],
                ),
                buildVSpacer(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileCard(
                        3, 'Field Officer / Area Manager', SignUpScreen3()),
                    buildHSpacer(30),
                    profileCard(
                        4,
                        'Branch Head / Regional Head',
                        SignUpScreen4(
                          userType: 'BRANCHHEAD',
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(int boxId, String title, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        elevation: 4,
        child: Container(
          width: 160,
          height: 130,
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
