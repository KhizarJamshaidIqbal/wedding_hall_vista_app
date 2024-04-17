// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'custom_Text_Widget.dart';

class CustomPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText;

  final String? Function(String?)? validator;

  CustomPasswordInputField(
      {required this.controller,
      required this.hintText,
      required this.labelText,
      this.validator});

  @override
  _CustomPasswordInputFieldState createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.labelText,
          color: globalColors.BlackColor,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
        15.h,
        TextFormField(
          controller: widget.controller,
          obscureText: _isPasswordVisible ? false : true,
          validator: widget.validator,

          style: TextStyle(
            color: globalColors.BlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            fillColor: globalColors.SecondaryColor,
            filled: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: globalColors.BlackColor,
                  size: 25),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,
              color: globalColors.BlackColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: globalColors.SecondaryColor),),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: globalColors.SecondaryColor),),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color:globalColors.SecondaryColor),
            ),
            labelStyle: TextStyle(color: globalColors.TitleColor),
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
