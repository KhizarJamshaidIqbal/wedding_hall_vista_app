import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: globalColors.WhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.h,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Placeholder(
                      fallbackHeight: 250,
                    ),
                  );
                },
              ),
              50.h,
            ],
          ),
        ),
      ),
    
    );
  }
}
