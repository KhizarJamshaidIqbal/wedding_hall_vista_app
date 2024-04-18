// ignore_for_file: unnecessary_new, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class RoundButtonWithIcon extends StatelessWidget {
  // final String image;
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onpress;
  const RoundButtonWithIcon(
      {super.key,
      required this.icon,
      required this.title,
      required this.onpress, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: globalColors.primaryColor,
              width: 1.7,
            )),
        child: Row(
          children: [
            15.w,
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(height: 34, width: 34, child:
              // Image.asset(image),
              FaIcon(icon,color: color,),

              ),
            ),
            // new SvgPicture.asset(
            //   'assets/images/GG.svg',
            //   allowDrawingOutsideViewBox: true,
            // ),
            20.w,
            CustomText(
              text: title,
              color: globalColors.WhiteColor,
              fontsize: 20,
              fontFamily: 'Literata-SemiBold',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
