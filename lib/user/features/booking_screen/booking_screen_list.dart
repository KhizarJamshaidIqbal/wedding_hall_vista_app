// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

class BookingListScreen extends StatefulWidget {
  final int initialIndex;
  final List<String> imgUrls;
  final String title;
  const BookingListScreen({
    super.key,
    required this.initialIndex,
    required this.imgUrls,
    required this.title,
  });

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  late List<Map<String, dynamic>> venue_img;
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.tertiaryColor,
      appBar: AppBar(
        backgroundColor: globalColors.tertiaryColor,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.h,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.imgUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          widget.imgUrls[index],
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
