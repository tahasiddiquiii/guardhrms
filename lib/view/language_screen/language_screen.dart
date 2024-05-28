import 'dart:async';
import 'package:flutter/material.dart';
import 'package:security_app/view/app_widgets/app_widgets.dart';
import 'package:security_app/view/app_widgets/custom_button.dart';
import 'package:security_app/view/language_screen/language_widget.dart';
import 'package:security_app/view/select_profile_screen/select_profile_screen.dart';
import 'package:security_app/view/sign_up/sign_up_screen1.dart';
// Ensure you've correctly imported all your necessary packages and files

class LanguageScreen extends StatefulWidget {
  @override
  State createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _isLanguageSelected =
      false; // Flag to track if a language has been selected
  String _selectedLanguage = ''; // Add this line

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.forward();
  }

  void _handleLanguageSelection(String language) {
    setState(() {
      _selectedLanguage = language;
      _isLanguageSelected =
          true; // Set this flag to true when a language is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/language_select.png",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'हिंदी',
                            subtitle: 'HINDI',
                            text: 'आ',
                            isSelected: _selectedLanguage ==
                                'HINDI', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'HINDI'); // Pass 'English' when this is tapped
                            },
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'English',
                            subtitle: 'ENGLISH',
                            text: 'A',
                            isSelected: _selectedLanguage ==
                                'English', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'English'); // Pass 'English' when this is tapped
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'Hinglish',
                            subtitle: 'Hinglish',
                            text: 'आ-A',
                            isSelected: _selectedLanguage ==
                                'Hinglish', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'Hinglish'); // Pass 'English' when this is tapped
                            },
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'मराठी',
                            subtitle: 'MARATHI',
                            text: 'म',
                            isSelected: _selectedLanguage ==
                                'MARATHI', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'MARATHI'); // Pass 'English' when this is tapped
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLanguage(
                            title: 'ਪੰਜਾਬੀ',
                            subtitle: 'PUNJABI',
                            text: 'ਪੰ',
                            isSelected: _selectedLanguage ==
                                'PUNJABI', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'PUNJABI'); // Pass 'English' when this is tapped
                            },
                          ),
                          buildHSpacer(10),
                          CustomLanguage(
                            title: 'ಕನ್ನಡ',
                            subtitle: 'KANNAD',
                            text: 'ಕ',
                            isSelected: _selectedLanguage ==
                                'KANNAD', // Check if English is selected
                            onPressed: () {
                              _handleLanguageSelection(
                                  'KANNAD'); // Pass 'English' when this is tapped
                            },
                          ),
                        ],
                      ),
                    ),
                    if (_isLanguageSelected) // Conditionally display the Continue button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: CustomButton(
                          text: 'Continue',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectProfileScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    buildVSpacer(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
