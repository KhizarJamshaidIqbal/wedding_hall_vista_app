// ignore_for_file: file_names, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, override_on_non_overriding_member, override_on_non_overriding_member, unused_field, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_super_parameters, duplicate_ignore, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding_hall_visla/constants/colors.dart';

//CustomHomeScreenAppbar
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      centerTitle: true,
      iconTheme: IconThemeData(color: globalColors.WhiteColor),
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: SizedBox(
                height: 15,
                width: 15,
                child: SvgPicture.asset(
                  "assets/images/Drawer_Icon_2.svg",
                ),
              ),
            ),
          );
        },
      ),
      title: Text(
        'AppLocalizations.of(context)!.appBarTitle',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            color: globalColors.WhiteColor),
      ),
      elevation: 0.9,
      backgroundColor: globalColors.primaryColor,
    );
  }
}

//CustomSettingScreenAppbar
class MyCustomAppBar extends StatelessWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      backgroundColor: Color(0xff1F8536),
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: globalColors.WhiteColor),
      title: Text(
        "More Settings",
        style: TextStyle(
          color: globalColors.WhiteColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
