// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, use_key_in_widget_constructors, unused_import, unused_local_variable, deprecated_member_use

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/CustomDrawer.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  late ScrollController controller;
  int _currentindex = 0;
  // late List<Widget> ScreenList;
  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List<Widget> ScreenList = [
    // HomeScreen(
    //     // scrollController: controller,
    //     ),
    // // Scanner(),
    // PickImage(),
    // UVLightScreen(),
    // Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HomeAppBar(),
      // drawer: CustomDrawer(user: FirebaseAuth.instance.currentUser),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          HomeAppBar(),
        ],
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: globalColors.primaryGradient,
            ),
            child: ScreenList[_currentindex]),
      ),
      extendBody: true,
      backgroundColor: globalColors.primaryColor,

      // bottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Theme(
            data: ThemeData(
              canvasColor: globalColors.primaryColor,
            ),
            child: BottomNavigationBar(
              backgroundColor: globalColors.primaryColor,
              selectedItemColor: globalColors.SecondaryColor,
              unselectedItemColor: globalColors.WhiteColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Services',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Booking',
                ),
                BottomNavigationBarItem(
                 icon: Icon(Icons.home),
                  label: 'Venue',
                ),
              ],
              currentIndex: _currentindex,
              onTap: (value) {
                setState(() {
                  _currentindex = value;
                });
              },
            ),
          ),
        ),
      ),

      // floatingActionButton
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: _currentindex == 0
          ? FloatingActionButton(
              shape: CircleBorder(eccentricity: 0.5),
              backgroundColor: globalColors.primaryColor,
              elevation: 0.5,
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/images/SelectedScanner.svg',
                color: globalColors.WhiteColor,
              ),
            )
          : null,
    );
  }
}
