import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: globalColors.tertiaryColor,
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
