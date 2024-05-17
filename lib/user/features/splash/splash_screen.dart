// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller!.forward();
    _controller!.addListener(() {
      if (kDebugMode) {
        print(_controller!.value);
      }
      setState(() {});
    });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final FirebaseAuth auth = FirebaseAuth.instance;
        final user = auth.currentUser;
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CustomBottomNavigationbar()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      }
    });
    // Timer(Duration(seconds: 3), () {
    //   final FirebaseAuth auth = FirebaseAuth.instance;
    //   final user = auth.currentUser;
    //   if (user != null) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => CustomBottomNavigationbar()),
    //     );
    //   } else {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => Login()),
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globalColors.WhiteColor,
        body: Center(
          child: SizedBox(
            // height: 200,
            // width: 200,
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget? child) {
                return Lottie.asset('assets/images/lottie_file/start.json');
              },
              animation: _controller!,
            ),
            // Image.asset(
            //   'assets/images/wedding_hall_visla_logo.png',
            // ),
          ),
        ));
  }
}
