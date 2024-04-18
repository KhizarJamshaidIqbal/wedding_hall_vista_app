// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';
import 'package:intl/intl.dart';
import 'package:wedding_hall_visla/widgets/rounded_btn.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  String? _selectedDropdownValue;
  List<bool> _isCheckedList = [false, false, false, false, false];

  final TextEditingController _no_of_guest_controller = TextEditingController();
  final TextEditingController _Phone_number_controller = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globalColors.WhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: globalColors.GreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          0.h,
                          const CustomText(
                            text: 'Chose Function Type',
                            color: globalColors.BlackColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 18,
                          ),
                          10.h,
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return const FittedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                              'assets/images/wedding_hall_visla_logo1.jpg'),
                                        ),
                                        FittedBox(
                                          child: CustomText(
                                            text: 'Function',
                                            color: globalColors.BlackColor,
                                            fontsize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          15.h,
                          const CustomText(
                            text: 'Date & Sessions',
                            color: globalColors.BlackColor,
                            fontsize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          10.h,
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => _selectDate(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectedDate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(_selectedDate!)
                                            : 'Select Date',
                                        style: const TextStyle(
                                            color: globalColors.BlackColor),
                                      ),
                                      const Icon(
                                        Icons.calendar_today,
                                        color: globalColors.BlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              20.w,
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: globalColors.BlackColor,
                                    size: 30,
                                  ),
                                  value: _selectedDropdownValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedDropdownValue = value!;
                                    });
                                  },
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: globalColors.BlackColor),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          20.h,
                          const CustomText(
                            text: 'No of Guest',
                            color: globalColors.BlackColor,
                            fontsize: 20,
                          ),
                          0.h,
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: _no_of_guest_controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '500 - 600',
                                hintStyle: TextStyle(
                                  color: globalColors.BlackColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              cursorColor: globalColors.BlackColor,
                              cursorWidth: 2.0,
                              cursorHeight: 25.0,
                            ),
                          ),
                          const CustomText(
                            text: 'Booking Price',
                            color: globalColors.BlackColor,
                            fontsize: 20,
                          ),
                          10.h,
                          const CustomText(
                            text: 'Price according to your no of guest',
                            color: globalColors.BlackColor,
                            fontsize: 16,
                          ),
                          20.h,
                          const CustomText(
                            text: 'Select Services You Want',
                            color: globalColors.BlackColor,
                            fontsize: 20,
                          ),
                          10.h,
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 150,
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isCheckedList[index],
                                                checkColor:
                                                    globalColors.BlackColor,
                                                activeColor:
                                                    globalColors.WhiteColor,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isCheckedList[index] =
                                                        value!;
                                                  });
                                                },
                                              ),
                                              const Text('Checkbox Text'),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          15.h,
                          const CustomText(
                            text: 'Enter Contact Detail',
                            color: globalColors.BlackColor,
                            fontsize: 20,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: _Phone_number_controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Enter Phone Number',
                                hintStyle: TextStyle(
                                  color: globalColors.BlackColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              cursorColor: globalColors.BlackColor,
                              cursorWidth: 2.0,
                              cursorHeight: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.h,
                  RoundButton(
                    title: 'Book Now',
                    backgroundColor: globalColors.primaryColor,
                    textcolor: globalColors.BlackColor,
                    borderSideColor: globalColors.primaryColor,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
