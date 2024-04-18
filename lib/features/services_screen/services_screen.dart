import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: globalColors.GreyColor,
                        ),
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Placeholder(
                                fallbackHeight: 150,
                              ),
                            ),
                            15.h,
                            const CustomText(
                              text: 'Category',
                              color: globalColors.BlackColor,
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
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
