// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, use_key_in_widget_constructors, unused_import, unused_local_variable, deprecated_member_use

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/user/features/booking_screen/booking_screen.dart';
import 'package:wedding_hall_visla/user/features/services_screen/services_screen.dart';
import 'package:wedding_hall_visla/user/features/venue_screen/venue_screen.dart';

import '../../../user/features/home_screen/home_screen.dart';
import '../../../user/features/model_screens/camer_screen.dart';
import '../../../widgets/CustomAppbar.dart';
import '../../../widgets/CustomDrawer.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/users/user_screen.dart';

class AdminCustomBottomNavigationbar extends StatefulWidget {
  const AdminCustomBottomNavigationbar({super.key});

  @override
  State<AdminCustomBottomNavigationbar> createState() =>
      _AdminCustomBottomNavigationbarState();
}

class _AdminCustomBottomNavigationbarState
    extends State<AdminCustomBottomNavigationbar> {
  int _currentindex = 0;

  List<Widget> ScreenList = [
    AdminHomeScreen(),
    UsersScreen(),
    BookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      // drawer: CustomDrawer(user: FirebaseAuth.instance.currentUser),
      body: ScreenList[_currentindex],
      extendBody: true,
      backgroundColor: Colors.grey,

      // bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: globalColors.WhiteColor,
        selectedItemColor: globalColors.BlueColor,
        unselectedItemColor: globalColors.GreyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gift),
            label: 'Booking',
          ),
        ],
        currentIndex: _currentindex,
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
      ),
    );
  }
}
