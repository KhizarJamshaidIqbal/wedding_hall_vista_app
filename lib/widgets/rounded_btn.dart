// // ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable, use_super_parameters, unused_import

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'custom_Text_Widget.dart';

class RoundButton extends StatelessWidget {
  final String title;
  bool loading;
  final Color textcolor,backgroundColor,borderSideColor;
  final VoidCallback onPress;

  RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.textcolor = Colors.white,
    this.backgroundColor=const Color(0xff042D0D),
    this.borderSideColor=const Color(0xff26993F),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: loading ? null : onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: borderSideColor,
            width: 1,
          ),
          // minimumSize: const Size.fromHeight(55),
        ),
        child: loading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 50,
              )
            : Center(
                child: CustomText(
                  text: title,
                  color: textcolor,
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
