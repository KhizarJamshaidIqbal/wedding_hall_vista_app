// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/user/features/services_screen/services_list.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

import '../../../model/servises_jason_model/wedding_hall_vista_api_key.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late List<Map<String, dynamic>> venue_img;

  @override
  void initState() {
    super.initState();
    final dynamic list = WeddingHallVistaApiKey.weddingHallVista;
    venue_img = List<Map<String, dynamic>>.from(list[0]['Services']);
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
                itemCount: venue_img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicessListScreen(
                              initialIndex: index,
                              imgUrls: List<String>.from(
                                  venue_img[index]["Services_type_images"]),
                              title: venue_img[index]["Services_type"],
                            ),
                          ),
                        );
                      },
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
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: Image.asset(
                                  venue_img[index]["icon"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              CustomText(
                                text: venue_img[index]["Services_type"],
                                color: globalColors.BlackColor,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
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
