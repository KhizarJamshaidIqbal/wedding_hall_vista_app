// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, deprecated_member_use, no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:wedding_hall_visla/user/features/auth/Login.dart';
import 'package:wedding_hall_visla/user/features/auth/auth.dart';
import 'package:wedding_hall_visla/widgets/CustomSnackbar.dart';

import '../user/features/about_us/about_us.dart';
import '../user/share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';

class CustomDrawer extends StatelessWidget {
  final User? user;
  CustomDrawer({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    
    // void shareApp() {
    //   Share.share('Thank you for sharing our Wedding Hall Vista App  https://play.google.com/store/apps/details?id=com.example.wedding_hall_visla');
    // }

    Widget drawerHeader = user != null
        ? UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: globalColors.primaryColor,
            ),
            accountEmail: Text(user!.email ?? ''),
            accountName: Text(user!.displayName ?? ''),
            currentAccountPicture: user!.photoURL != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL!),
                  )
                : CircleAvatar(
                    backgroundColor: globalColors.WhiteColor,
                    child: Text(
                      user!.email![0].toUpperCase(),
                      style: TextStyle(
                        color: globalColors.BlackColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
          )
        : DrawerHeader(
            decoration: BoxDecoration(color: globalColors.WhiteColor),
            child: CircleAvatar(
              radius: 100,
              backgroundImage:
                  AssetImage('assets/images/wedding_hall_visla_logo.png'),
            ),
          );
    return Drawer(
      width: MediaQuery.of(context).size.width * .65,
      surfaceTintColor: globalColors.WhiteColor,
      clipBehavior: Clip.none,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          drawerHeader,
          Column(
            children: [
              5.h,
              ListTile(
                splashColor: globalColors.BlueColor.withOpacity(0.5),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: globalColors.GreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Icon(
                      Icons.home,
                      color: globalColors.GreyColor,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationbar(),
                      ));
                },
              ),
              ListTile(
                splashColor: globalColors.BlueColor.withOpacity(0.5),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    color: globalColors.GreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Icon(
                      CupertinoIcons.group_solid,
                      color: globalColors.GreyColor,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsSCreen(),
                      ));
                },
              ),
              ListTile(
                splashColor: globalColors.BlueColor.withOpacity(0.5),
                title: Text(
                  'login',
                  style: TextStyle(
                    color: globalColors.GreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: globalColors.GreyColor,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
              ),
              ListTile(
                splashColor: globalColors.BlueColor.withOpacity(0.5),
                title: Text(
                  'Share',
                  style: TextStyle(
                      color: globalColors.GreyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 20,
                    child: Icon(
                      Icons.share_outlined,
                      color: globalColors.GreyColor,
                    ),
                  ),
                ),
                onTap: () async {
                  // shareApp();
                  try {
                    Share.share(
                        "https://play.google.com/store/apps/details?id=com.example.wedding_hall_visla");
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              ListTile(
                splashColor: globalColors.BlueColor.withOpacity(0.5),
                title: Text(
                  'Rate Us',
                  style: TextStyle(
                    color: globalColors.GreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 20,
                    child: Icon(
                      Icons.star_border_purple500_sharp,
                      color: globalColors.GreyColor,
                    ),
                  ),
                ),
                onTap: () {
                  try {
                  StoreRedirect.redirect(androidAppId: "com.iyaffle.rangoli",
                    iOSAppId: "585027354");
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              50.h,
              ListTile(
                splashColor: globalColors.RedColor,
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 20,
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ),
                onTap: () async {
                  FirebaseAuthServices authService = FirebaseAuthServices();
                  try {
                    await authService.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                    CustomSnackbar.show(context, 'Logout',
                        backgroundColor: Colors.red);
                  } catch (e) {
                    print('Error signing out: $e');
                    // CustomSnackbar.show(context, 'Error signing out: $e',
                    //     backgroundColor: Colors.red);
                  }
                  FirebaseAuth.instance.signOut().then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                    CustomSnackbar.show(context, 'Logout',
                        backgroundColor: Colors.red);
                  }).catchError((error) {
                    print('Error signing out: $error');
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
