// ignore_for_file: prefer_final_fields

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  // bool _expanded = false;
  Map<int, bool> _expandedMap = {};
  final databaseRef = FirebaseDatabase.instance.ref('Book Order');
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: globalColors.tertiaryColor,
      body: Column(
        children: [
          20.h,
          const Align(
            alignment: Alignment.topCenter,
            child: CustomText(
              text: 'Order Details',
              color: globalColors.BlackColor,
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              defaultChild: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: globalColors.primaryColor,
                  ),
                  10.h,
                  const Text('Loading'),
                ],
              )),
              itemBuilder: (context, snapshot, animation, index) {
                if (!_expandedMap.containsKey(index)) {
                  _expandedMap[index] = false;
                }
                final bool _expanded = _expandedMap[index] ?? false;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        height: _expanded ? screenHeight * .38 : 75,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Row(
                                children: [
                                  const CustomText(
                                    text: 'Order Id: ',
                                    color: Colors.black,
                                    fontsize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  10.w,
                                  CustomText(
                                    text: snapshot.child("id").value.toString(),
                                    color: Colors.black,
                                    fontsize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // _expanded = !_expanded;
                                        _expandedMap[index] = !_expanded;
                                      });
                                    },
                                    child: Icon(_expanded
                                        ? CupertinoIcons.arrow_up_to_line
                                        : CupertinoIcons.arrow_down_to_line),
                                  ),
                                  30.w,
                                ],
                              ),
                            ),
                            if (_expanded)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          10.h,
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                const CustomText(
                                                  text: 'Fuction Date:',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontsize: 20,
                                                ),
                                                10.w,
                                                CustomText(
                                                  text: snapshot
                                                      .child('Date')
                                                      .value
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontsize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                          20.h,
                                          Row(
                                            children: [
                                              const CustomText(
                                                text: 'Fuction Sessions:',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontsize: 20,
                                              ),
                                              10.w,
                                              CustomText(
                                                text: snapshot
                                                    .child('Session')
                                                    .value
                                                    .toString(),
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontsize: 18,
                                              ),
                                            ],
                                          ),
                                          20.h,
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                const CustomText(
                                                  text: 'Number of Guest:',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontsize: 20,
                                                ),
                                                10.w,
                                                 CustomText(
                                                  text: snapshot
                                                      .child('Number of Guest')
                                                      .value
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontsize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                          20.h,
                                          Row(
                                            children: [
                                              const CustomText(
                                                text: 'Selected Services:',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontsize: 20,
                                              ),
                                              10.w,
                                               CustomText(
                                                text: snapshot
                                                    .child('Services You Want')
                                                    .value
                                                    .toString(),
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontsize: 18,
                                              ),
                                            ],
                                          ),
                                          20.h,
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                const CustomText(
                                                  text: 'Contact Detail:',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontsize: 20,
                                                ),
                                                10.w,
                                                 CustomText(
                                                  text: snapshot
                                                      .child('Contact Detail')
                                                      .value
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontsize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
