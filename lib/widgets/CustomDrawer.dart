// ignore_for_file: file_names
// // ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, deprecated_member_use, no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:wedding_hall_visla/constants/app_size.dart';
// import 'package:wedding_hall_visla/constants/colors.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:store_redirect/store_redirect.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../constants/privacypolicy.dart';
// import 'line.dart';

// class CustomDrawer extends StatelessWidget {
//   final User? user;
//   CustomDrawer({super.key, this.user});

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _launchURL(String url) async {
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Could not launch $url';
//       }
//     }

//     Widget drawerHeader = user != null
//         ? UserAccountsDrawerHeader(
//             decoration: BoxDecoration(gradient: globalColors.primaryGradient),
//             accountEmail: Text(user!.email ?? ''),
//             accountName: Text(user!.displayName ?? ''),
//             currentAccountPicture: user!.photoURL != null
//                 ? CircleAvatar(
//                     backgroundImage: NetworkImage(user!.photoURL!),
//                   )
//                 : CircleAvatar(
//                     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                     child: Text(
//                       user!.displayName![0].toUpperCase(),
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 37, 182, 9),
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//           )
//         : DrawerHeader(
//             decoration: BoxDecoration(gradient: globalColors.primaryGradient),
//             child: Image.asset('wedding_hall_visla_logo1.jpg'),
//           );

//     // Widget drawerHeader;

//     // if (user != null) {
//     //   String initial =
//     //       user!.email?.isNotEmpty == true ? user!.email![0].toUpperCase() : '';
//     //   var data = user?.photoURL != null
//     //           ? CircleAvatar(
//     //               backgroundImage: NetworkImage(user!.photoURL!),
//     //             )
//     //           : CircleAvatar(
//     //               backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//     //               child: Text(
//     //                 initial,
//     //                 style: TextStyle(
//     //                   color: Color.fromARGB(255, 37, 182, 9),
//     //                   fontSize: 24,
//     //                 ),
//     //               ),
//     //             ),
//     //       drawerHeader = UserAccountsDrawerHeader(
//     //         accountEmail: Text(user!.email ?? ''),
//     //         accountName: Text(user!.displayName ?? ''),
//     //         currentAccountPicture: data
//     //         // CircleAvatar(
//     //         //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//     //         //   // child: Text(
//     //         //   //   initial,
//     //         //   //   style: TextStyle(
//     //         //   //     color: Color.fromARGB(255, 37, 182, 9),
//     //         //   //     fontSize: 24,
//     //         //   //   ),
//     //         //   // ),
//     //         // ),
//     //       );
//     // } else {
//     //   drawerHeader = DrawerHeader(
//     //     decoration: BoxDecoration(gradient: globalColors.primaryGradient),
//     //     child: SvgPicture.asset("assets/images/PCSAD_Logo.svg"),
//     //   );
//     // }
//     return Drawer(
//       surfaceTintColor: globalColors.WhiteColor,
//       clipBehavior: Clip.none,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           drawerHeader,
//           Column(
//             children: [
//               5.h,
//               ListTile(
//                 title: Text(
//                   'AppLocalizations.of(context)!.scn',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 25,
//                     child: Icon(Icons.camera),
//                   ),
//                 ),
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => Scanner(),
//                   //     ));
//                 },
//               ),
//               line2(),
//               ListTile(
//                 title: Text(
//                   'Share',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.share),
//                   ),
//                 ),
//                 onTap: () async {
//                   // try {
//                   //   Share.share(
//                   //       "https://play.google.com/store/apps/details?id=com.sharasol.PKR_Fake_Check_Guide");
//                   // } catch (e) {
//                   //   print(e.toString());
//                   // }
//                 },
//               ),
//               line2(),
//               ListTile(
//                 title: Text(
//                   'Rate Us',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.star_border_purple500_sharp),
//                   ),
//                 ),
//                 onTap: () {
//                   // StoreRedirect.redirect(
//                   //   androidAppId: "com.sharasol.PKR_Fake_Check_Guide",
//                   // );
//                 },
//               ),
//               line2(),
//               ListTile(
//                 title: Text(
//                   'More Apps',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.unfold_more_double_outlined),
//                   ),
//                 ),
//                 onTap: () {
//                   _launchURL(
//                       "https://play.google.com/store/apps/dev?id=8994386378575122109&hl=en_IN");
//                 },
//               ),
//               line2(),
//               ListTile(
//                 title: Text(
//                   'Feedback',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.feedback_outlined),
//                   ),
//                 ),
//                 onTap: () {
//                   launch('mailto:21101001-058@uskt.edu.pk');
//                 },
//               ),
//               line2(),
//               ListTile(
//                 title: Text(
//                   'Privacy Policy',
//                   style: TextStyle(
//                       color: globalColors.primaryColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.security_sharp),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PrivacyPolicy(),
//                       ));
//                 },
//               ),
//               line2(),
//               30.h,
//               // ListTile(
//               //   title: const Text(
//               //     'Report',
//               //     style: TextStyle(
//               //         color: globalColors.primaryColor,
//               //         fontSize: 16,
//               //         fontWeight: FontWeight.w600,
//               //         fontFamily: "Inter"),
//               //   ),
//               //   leading: Padding(
//               //     padding: const EdgeInsets.only(left: 5),
//               //     child: SizedBox(
//               //         height: 25,
//               //         width: 20,
//               //         child: SvgPicture.asset("assets/images/Report.svg")),
//               //   ),
//               //   onTap: () {
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //           builder: (context) => PrivacyPolicy(),
//               //         ));
//               //   },
//               // ),
//               ListTile(
//                 title: Text(
//                   'Logout',
//                   style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Inter"),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: SizedBox(
//                     height: 25,
//                     width: 20,
//                     child: Icon(Icons.logout),
//                   ),
//                 ),
//                 onTap: () async {
//                   // FirebaseAuthServices authService = FirebaseAuthServices();
//                   // try {
//                   //   await authService.signOut();
//                   //   Navigator.pushReplacement(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => Login(),
//                   //     ),
//                   //   );
//                   //   CustomSnackbar.show(context, 'Logout',
//                   //       backgroundColor: Colors.red);
//                   // } catch (e) {
//                   //   print('Error signing out: $e');
//                   //   // CustomSnackbar.show(context, 'Error signing out: $e',
//                   //   //     backgroundColor: Colors.red);
//                   // }
//                   // FirebaseAuth.instance.signOut().then((_) {
//                   //   Navigator.pushReplacement(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => Login(),
//                   //     ),
//                   //   );
//                   //   CustomSnackbar.show(context, 'Logout',
//                   //       backgroundColor: Colors.red);
//                   // }).catchError((error) {
//                   //   print('Error signing out: $error');
//                   // });
//                 },
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Column(
//                 children: [
//                   Container(
//                     height: 1,
//                     width: 120,
//                     color: globalColors.primaryColor,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'App Version',
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: globalColors.primaryColor,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "Inter"),
//                       ),
//                       Text(
//                         "1.0.0+1",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: globalColors.primaryColor,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "Inter"),
//                       )
//                     ],
//                   ),
//                   Container(
//                     height: 1,
//                     width: 120,
//                     color: globalColors.primaryColor,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
