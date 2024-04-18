// ignore_for_file: sort_child_properties_last, camel_case_types, use_super_parameters

import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class line extends StatelessWidget {
  const line({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            width: MediaQuery.of(context).size.width * .4,
            child: const Text(''),
            decoration: const BoxDecoration(
                color: globalColors.WhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
        const CustomText(
            text: '  Or  ', color: globalColors.WhiteColor, fontsize: 20),
        Expanded(
          child: Container(
            height: 2,
            width: MediaQuery.of(context).size.width * .4,
            child: const Text(''),
            decoration: const BoxDecoration(
                color: globalColors.WhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ],
    );
  }
}

class line2 extends StatelessWidget {
  final Color color;

  const line2({Key? key, this.color = globalColors.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: color,
    );
  }
}
