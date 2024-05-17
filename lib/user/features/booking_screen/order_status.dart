// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wedding_hall_visla/user/share/custom%20bottom%20navigation%20bar/custom_bottom_navigation_bar.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({
    super.key,
  });
  // bool isOrderStatus;
  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  // bool isOrderStatus = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller!.forward();
    _controller!.addListener(() {
      if (kDebugMode) {
        print(_controller!.value);
      }
      setState(() {});
    });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomBottomNavigationbar(),
          ),
        );
      }
    });
  }
String orderStatus = 'OrderStatus';
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: orderStatus,
        child: Center(
          child: AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return Lottie.asset('assets/images/lottie_file/welcome.json');
            },
            animation: _controller!,
          ),
        ),
      ),
    );
  }
}
