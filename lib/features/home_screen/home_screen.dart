import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.tertiaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              25.h,
              const Align(
                alignment: Alignment.topCenter,
                child: CustomText(
                  text: 'Want Virtual Tour',
                  color: globalColors.BlackColor,
                  fontWeight: FontWeight.bold,
                  fontsize: 25,
                ),
              ),
              30.h,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
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
