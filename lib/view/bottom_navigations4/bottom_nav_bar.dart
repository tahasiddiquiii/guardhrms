import 'package:flutter/material.dart';
import 'package:security_app/view/bottom_navigations1/app_drawer.dart';
import 'package:security_app/view/bottom_navigations4/app_drawer.dart';
import 'package:security_app/view/bottom_navigations4/bottom_navbar_items/apply_leave.dart';
import 'package:security_app/view/bottom_navigations4/bottom_navbar_items/home.dart';
import 'package:security_app/view/bottom_navigations4/bottom_navbar_items/profile_screen.dart';
import 'package:security_app/view/bottom_navigations4/bottom_navbar_items/salary_slip_screen.dart';

class AppBottomNavBar4 extends StatefulWidget {
  int? index;

  AppBottomNavBar4({
    this.index,
    super.key,
  });

  @override
  State<AppBottomNavBar4> createState() => _AppBottomNavBar4State();
}

class _AppBottomNavBar4State extends State<AppBottomNavBar4> {
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _body = [
    Home4(),
    SalarySlipScreen4(),
    ApplyLeaveScreen4(),
    ProfileScreen4(),
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
      drawer: const AppDrawer4(),
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
