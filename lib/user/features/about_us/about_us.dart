// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, deprecated_member_use, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/CustomAppbar.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';

class AboutUsSCreen extends StatelessWidget {
  const AboutUsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to launch the email app
void _launchEmail(String email) async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
  );

  try {
    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  } catch (e) {
    print('Error launching email: $e');
  }
}


    return Scaffold(
      backgroundColor: globalColors.WhiteColor,
      appBar: const HomeAppBar(title: 'About Us'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              const CustomText(
                text:
                    'Welcome to Wedding Hall Vista, where dreams come to life and everlasting memories are created. We are not just a wedding hall; we are the architects of your perfect celebration. With a commitment to excellence and a passion for creating magical moments, we take pride in being the preferred choice for couples embarking on their journey of marital bliss.',
                color: globalColors.BlackColor,
                fontsize: 16,
                textAlign: TextAlign.justify,
              ),
              30.h,
              const CustomText(
                text: 'About Us',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'At Wedding Hall Vista we understand that every love story is unique, and your wedding day should reflect that individuality. Established with the vision of providing a seamless and enchanting wedding experience, our venue is designed to cater to all your needs, ensuring that your special day is nothing short of spectacular.',
                color: globalColors.BlackColor,
                fontsize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              30.h,
              const CustomText(
                text: 'Why Choose Us',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              20.h,
              const CustomText(
                text: '1. Exquisite Venue: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'Our wedding hall boasts a breathtaking and versatile space that can be transformed to suit any theme or style. From intimate gatherings to grand celebrations, our venue sets the stage for the wedding of your dreams.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              20.h,
              const CustomText(
                text: '2. Virtual Visit Experience: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'Experience the charm of our venue from the comfort of your home with our innovative virtual visit feature. Explore every corner, visualize your ceremony, and plan your reception with the click of a button.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              20.h,
              const CustomText(
                text: '3. Comprehensive Services: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'We go beyond just providing a stunning venue. Our comprehensive services include catering, decoration, security, waitstaff, floral arrangements, and more. Our team of seasoned professionals is dedicated to ensuring that every detail is executed flawlessly.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              20.h,
              const CustomText(
                text: '4. Culinary Excellence: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'Indulge your guests with a culinary journey that is as delightful as your love story. Our catering services offer a diverse menu curated with the finest ingredients, ensuring a gastronomic experience that leaves a lasting impression.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              20.h,
              const CustomText(
                text: '5. Expert Decorators: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'Elevate the ambiance of your celebration with our expert decorators. Whether you envision a classic, modern, or themed decor, our team will bring your vision to life, creating a mesmerizing backdrop for your special day.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              20.h,
              const CustomText(
                text: '6. Impeccable Service: ',
                color: globalColors.BlackColor,
                fontsize: 22,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              const CustomText(
                text:
                    'Our commitment to excellence extends to our service staff. Our experienced and courteous team ensures that every guest is treated with the utmost care and attention, allowing you to focus on enjoying your celebration.',
                color: globalColors.BlackColor,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.justify,
              ),
              30.h,
              const CustomText(
                text: 'Contact Us',
                color: globalColors.BlackColor,
                fontsize: 24,
                fontWeight: FontWeight.bold,
              ),
              10.h,
              RichText(
                textAlign: TextAlign.justify,
                text:  TextSpan(
                  style: const TextStyle(
                    color: globalColors.BlackColor,
                    fontSize: 20,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'Ready to embark on your journey to a perfect wedding day? Contact us at ',
                    ),
                    TextSpan(
                      text: 'weddinhhallvista@gmail.com',
                      style: const TextStyle(color: globalColors.BlueColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchEmail('weddinhhallvista@gmail.com');
                        },
                    ),
                    const TextSpan(
                      text:
                          ' to schedule a virtual visit, discuss your requirements, and start planning the celebration of a lifetime. At Wedding Hall Vista, we are not just hosting weddings; we are curating experiences that will be cherished forever. Your love story deserves nothing less than perfection, and we are here to make it a reality.',
                    ),
                  ],
                ),
              ),

              50.h,
            ],
          ),
        ),
      ),
    );
  }
}
