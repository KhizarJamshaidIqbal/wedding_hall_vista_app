// ignore_for_file: unused_element, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/user/features/booking_screen/order_status.dart';
import 'package:wedding_hall_visla/widgets/CustomSnackbar.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';
import 'package:intl/intl.dart';
import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../model/servises_jason_model/wedding_hall_vista_api_key.dart';
import 'booking_screen_list.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  //TextEditingController
  final TextEditingController _no_of_guest_controller = TextEditingController();
  final TextEditingController _Phone_number_controller =
      TextEditingController();
  //Variables
  int? _selectedServicesIndex;
  DateTime? _selectedDate;
  String? _selectedDropdownValue;
  bool isloading = false;
  // bool OrderStatus = false;
  String orderStatus = 'OrderStatus';
  List<bool> _isCheckedList = [false, false, false, false, false];
  late List<Map<String, dynamic>> venue_img, venue_img2;

  //Firebase Realtime Database
  final databaseRef = FirebaseDatabase.instance.ref('Book Order');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globalColors.WhiteColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: orderStatus,
              createRectTween: (begin, end) {
                return MaterialRectArcTween(begin: begin, end: end);
              },
              child: orderScreenData(),
            ),
            // OrderStatusScreen(
            //   isOrderStatus: OrderStatus,
            // ),
          ],
        ));
  }

  //orderScreenData Function
  Widget orderScreenData() {
    return Padding(
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
                          itemCount: venue_img.length,
                          itemBuilder: (context, index) {
                            return FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookingListScreen(
                                              initialIndex: index,
                                              imgUrls: List<String>.from(
                                                  venue_img[index]
                                                      ["Services_type_images"]),
                                              title: venue_img[index]
                                                  ["Services_type"],
                                            ),
                                          ),
                                        );
                                      },
                                      child: _selectedServicesIndex == index
                                          ? CircleAvatar(
                                              radius: 65,
                                              backgroundColor:
                                                  globalColors.primaryColor,
                                              child: Stack(
                                                children: [
                                                  Center(
                                                    child: CircleAvatar(
                                                      radius: 60,
                                                      backgroundImage:
                                                          AssetImage(venue_img[
                                                                      index][
                                                                  "Services_type_images"]
                                                              [1]),
                                                    ),
                                                  ),
                                                  const Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: globalColors
                                                          .primaryColor,
                                                      size: 100,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 60,
                                              backgroundImage: AssetImage(
                                                  venue_img[index][
                                                          "Services_type_images"]
                                                      [1]),
                                            ),
                                    ),
                                    10.h,
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedServicesIndex = index;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                _selectedServicesIndex == index
                                                    ? globalColors.primaryColor
                                                    : Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: CustomText(
                                              text: venue_img[index]
                                                  ["Services_type"],
                                              color: globalColors.BlackColor,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 18,
                                            ),
                                          ),
                                        ),
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
                              value: _selectedDropdownValue ?? 'Select',
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedDropdownValue = value!;
                                });
                              },
                              items: <String>[
                                'Select',
                                'Day Time',
                                'Night Time',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: globalColors.BlackColor,
                                    ),
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
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                                itemCount: venue_img2.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 150,
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: _isCheckedList[index],
                                            checkColor: globalColors.BlackColor,
                                            activeColor:
                                                globalColors.WhiteColor,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _isCheckedList[index] =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          FittedBox(
                                            child: CustomText(
                                              text: venue_img2[index]
                                                  ["Services_type"],
                                              color: globalColors.BlackColor,
                                              fontsize: 18,
                                            ),
                                          )
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
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                loading: isloading,
                backgroundColor: globalColors.primaryColor,
                textcolor: globalColors.BlackColor,
                borderSideColor: globalColors.primaryColor,
                onPress: bookOrder,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //selectDate Function
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

  //bookOrder Function
  void bookOrder() {
    setState(() {
      isloading = true;
    });
    if (_selectedServicesIndex == null ||
        _selectedDate == null ||
        _selectedDropdownValue == null ||
        _no_of_guest_controller.text.isEmpty ||
        !_isCheckedList.contains(true) ||
        _Phone_number_controller.text.isEmpty) {
      CustomSnackbar.show(
        context,
        'Please Select all required fields',
        backgroundColor: Colors.red,
      );
      setState(() {
        isloading = false;
        // OrderStatus = false;
      });
      return;
    }
    databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
      "id": DateTime.now().millisecondsSinceEpoch.toString(),
      "Function Type": _selectedServicesIndex != null
          ? venue_img[_selectedServicesIndex!]["Services_type"]
          : "",
      "Date": DateFormat('yyyy-MM-dd').format(_selectedDate!).toString(),
      "Session": _selectedDropdownValue.toString(),
      "Number of Guest": _no_of_guest_controller.text.toString(),
      "Services You Want": _selectedServicesIndex != null
          ? _isCheckedList
              .asMap()
              .entries
              .where((entry) => entry.value)
              .map((entry) => venue_img2[entry.key]["Services_type"])
              .join(", ")
          : "",
      "Contact Detail": _Phone_number_controller.text.toString(),
    }).then((value) {
      CustomSnackbar.show(
        context,
        'Order is Book Now',
        backgroundColor: Colors.green,
      );
      setState(() {
        // OrderStatus = true;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderStatusScreen(),
            ));
        isloading = false;
      });
    }).onError((error, stackTrace) {
      CustomSnackbar.show(
        context,
        '$error',
        backgroundColor: Colors.red,
      );
      setState(() {
        // OrderStatus = false;
        isloading = false;
      });
    });
  }

  //initState Function
  @override
  void initState() {
    super.initState();
    final dynamic list = WeddingHallVistaApiKey.weddingHallVista;
    // venue_img
    venue_img = List<Map<String, dynamic>>.from(list[1]["Services"]);
    venue_img2 = List<Map<String, dynamic>>.from(list[0]['Services']);
  }

  //dispose Function
  @override
  void dispose() {
    _no_of_guest_controller.dispose();
    _Phone_number_controller.dispose();
    super.dispose();
  }
}
