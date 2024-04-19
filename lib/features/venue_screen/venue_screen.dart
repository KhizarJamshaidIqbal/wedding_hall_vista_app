// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/model/servises_jason_model/wedding_hall_vista_api_key.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  late List<String> venue_img;

  @override
  void initState() {
    super.initState();
    final dynamic list = WeddingHallVistaApiKey.weddingHallVista;
    venue_img =
        List<String>.from(list[2]["Services"][0]["Services_type_images"]);
  }

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
                itemCount:venue_img.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                            venue_img[index]),
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
