// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class RoundedTextField extends StatelessWidget {
  final String labelText, hintText;
  bool? isOptional;
  final TextEditingController? controller;
  final TextInputType? inputType;

  final String? Function(String?)? validator;

  RoundedTextField({
    super.key,
    required this.labelText,
    this.isOptional = false,
    this.hintText = "",
    this.inputType,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: labelText,
              color: globalColors.BlackColor,
              fontsize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        15.h,
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: validator,
          style: TextStyle(
            color: globalColors.BlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            fillColor: globalColors.SecondaryColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: globalColors.BlackColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: globalColors.SecondaryColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: globalColors.SecondaryColor)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: globalColors.SecondaryColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
          ),
          cursorColor: globalColors.BlackColor,
          cursorWidth: 2.0,
          cursorHeight: 25.0,
        ),
      ],
    );
  }
}
