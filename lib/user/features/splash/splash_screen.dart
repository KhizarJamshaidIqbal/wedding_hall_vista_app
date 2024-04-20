// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/user/features/auth/Login.dart';
import 'package:wedding_hall_visla/user/share/custom%20bottom%20navigation%20bar/custom_bottom_navigation_bar.dart';
import '../../../main.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CustomBottomNavigationbar()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globalColors.WhiteColor,
        body: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(
              'assets/images/wedding_hall_visla_logo.png',
            ),
          ),
        ));
  }
}