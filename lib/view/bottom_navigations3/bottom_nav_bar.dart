import 'package:flutter/material.dart';
import 'package:security_app/view/bottom_navigations1/app_drawer.dart';
import 'package:security_app/view/bottom_navigations3/app_drawer.dart';
import 'package:security_app/view/bottom_navigations3/bottom_navbar_items/apply_leave.dart';
import 'package:security_app/view/bottom_navigations3/bottom_navbar_items/home.dart';
import 'package:security_app/view/bottom_navigations3/bottom_navbar_items/profile_screen.dart';
import 'package:security_app/view/bottom_navigations3/bottom_navbar_items/salary_slip_screen.dart';

class AppBottomNavBar3 extends StatefulWidget {
  int? index;

  AppBottomNavBar3({
    this.index,
    super.key,
  });

  @override
  State<AppBottomNavBar3> createState() => _AppBottomNavBar3State();
}

class _AppBottomNavBar3State extends State<AppBottomNavBar3> {
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _body = [
    Home3(),
    SalarySlipScreen3(),
    ApplyLeaveScreen3(),
    ProfileScreen3(),
  ];
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer3(),
      body: _body[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(31),
            topRight: Radius.circular(31),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 10,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(31),
            topRight: Radius.circular(31),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: (_selectedIndex == 0)
                    ? Image.asset('assets/home_selected.png')
                    : Image.asset('assets/home_unselected.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: (_selectedIndex == 1)
                    ? Image.asset('assets/salarySlip_selected.png')
                    : Image.asset('assets/salarySlip_unselected.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: (_selectedIndex == 2)
                    ? Image.asset('assets/applyLeave_selected.png')
                    : Image.asset('assets/applyLeave_unselected.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: (_selectedIndex == 3)
                    ? Image.asset('assets/profile_selected.png')
                    : Image.asset('assets/profile_unselected.png'),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
