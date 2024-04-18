import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: globalColors.WhiteColor,
      body: Center(
        child: Text('Venue Screen'),
      ),
    );
  }
}
