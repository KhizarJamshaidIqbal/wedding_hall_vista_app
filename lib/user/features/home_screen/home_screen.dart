// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

import '../../../model/servises_jason_model/wedding_hall_vista_api_key.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> venue_img;

  @override
  void initState() {
    super.initState();
    final dynamic list = WeddingHallVistaApiKey.weddingHallVista;
    venue_img =
        List<String>.from(list[0]["Services"][2]["Services_type_images"]);
  }

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
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          venue_img[index],
                          height: 360,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ));
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
