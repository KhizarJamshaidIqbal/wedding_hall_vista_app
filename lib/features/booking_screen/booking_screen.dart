import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: globalColors.WhiteColor,
      body: Center(
        child: Text('Booking Screen'),
      ),
    );
  }
}