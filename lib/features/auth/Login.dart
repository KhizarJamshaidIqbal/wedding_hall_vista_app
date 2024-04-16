// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, must_be_immutable, unused_field, override_on_non_overriding_member, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously, unused_element, unnecessary_null_comparison, unused_local_variable, prefer_final_fields

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:wedding_hall_visla/constants/app_size.dart';
// import 'package:wedding_hall_visla/constants/colors.dart';
// import 'package:wedding_hall_visla/constants/fonts.dart';
// import 'package:wedding_hall_visla/features/auth/auth.dart';
// import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';
// import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
// import '../../../widgets/CustomPasswordInputField.dart';
// import '../../../widgets/CustomSnackbar.dart';
// import '../../../widgets/custom_textField.dart';
// import '../../../widgets/line.dart';
// import '../../../widgets/rounded_btn_with_Icon.dart';
// import 'Register.dart';

// class Login extends StatefulWidget {
//   Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _isSigning = false;
//   bool _isLoading = false;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   FirebaseAuthServices authService = FirebaseAuthServices();
//   final TextEditingController EmailController = new TextEditingController();
//   final TextEditingController PasswordController = new TextEditingController();

//   @override
//   void dispose() {
//     EmailController.dispose();
//     PasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: globalColors.SecondaryColor,
//       body: Container(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(gradient: globalColors.primaryGradient),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: Stack(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     verticalDirection: VerticalDirection.down,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       60.h,
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(
//                           Icons.arrow_back,
//                           size: 35,
//                           color: globalColors.TitleColor,
//                         ),
//                       ),
//                       40.h,
//                       CustomText(
//                         text: 'Sign In',
//                         color: globalColors.TitleColor,
//                         fontsize: 20,
//                         fontFamily: fonts.fontfamily_1,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       5.h,
//                       CustomText(
//                         text:
//                             'Welcome Back!\nPlease enter your credentials to continue.',
//                         color: globalColors.WhiteColor,
//                         fontsize: 14,
//                         fontFamily: fonts.fontfamily_1,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       35.h,
//                       RoundedTextField(
//                         hintText: 'Enter Email Address here...',
//                         labelText: 'Email Address',
//                         icon: Icon(
//                           Icons.email_outlined,
//                           color: globalColors.TitleColor,
//                           size: 28,
//                         ),
//                         controller: EmailController,
//                         inputType: TextInputType.emailAddress,
//                       ),
//                       20.h,
//                       CustomPasswordInputField(
//                         controller: PasswordController,
//                         hintText: 'Enter new password here...',
//                         labelText: 'Password',
//                       ),
//                       10.h,
//                       Row(
//                         children: [
//                           const Spacer(),
//                           const CustomText(
//                             text: 'Forget your password?',
//                             color: globalColors.TitleColor,
//                             fontsize: 18,
//                             fontWeight: FontWeight.normal,
//                             fontFamily: 'Literata-SemiBold',
//                           ),
//                           5.w,
//                           InkWell(
//                             onTap: () {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //       builder: (context) => ResetPassword(),
//                               //     ));
//                             },
//                             child: const CustomText(
//                                 text: 'Reset Password',
//                                 color: globalColors.TitleColor,
//                                 fontsize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: fonts.fontfamily_1,
//                                 textDecoration: TextDecoration.underline),
//                           ),
//                           const Spacer(),
//                         ],
//                       ),
//                       30.h,
//                       line(),
//                       30.h,
//                       RoundButtonWithIcon(
//                         // image: 'assets/images/Google.jpg',
//                         icon: FontAwesomeIcons.google, color: Colors.redAccent,
//                         title: 'Continue with Google',
//                         onpress: () async {},
//                       ),
//                       10.h,
//                       RoundButtonWithIcon(
//                         color: Colors.blue,
//                         // image: 'assets/images/Facebook.jpg',
//                         icon: FontAwesomeIcons.facebook,
//                         title: 'Continue with Facebook',
//                         onpress: () async {},
//                       ),
//                       const Spacer(),
//                       RoundButton(
//                           title: 'Continue',
//                           loading: _isSigning,
//                           onPress: () {
//                             _signIn();
//                           }),
//                       10.h,
//                       Row(
//                         children: [
//                           const Spacer(),
//                           const CustomText(
//                             text: 'Don’t have an account?',
//                             color: globalColors.TitleColor,
//                             fontsize: 18,
//                             fontWeight: FontWeight.normal,
//                             fontFamily: 'Literata-SemiBold',
//                           ),
//                           5.w,
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Register(),
//                                   ));
//                             },
//                             child: const CustomText(
//                                 text: 'Sign Up',
//                                 color: globalColors.TitleColor,
//                                 fontsize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: fonts.fontfamily_1,
//                                 textDecoration: TextDecoration.underline),
//                           ),
//                           const Spacer(),
//                         ],
//                       ),
//                       20.h,
//                     ],
//                   ),
//                   _isLoading
//                       ? Center(
//                           child: Container(
//                             height: 200,
//                             width: 200,
//                             decoration: BoxDecoration(
//                               color: globalColors.WhiteColor.withOpacity(0.5),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20.0),
//                               ),
//                             ),
//                             child: LoadingAnimationWidget.fallingDot(
//                               color: globalColors.primaryColor,
//                               size: 110,
//                             ),
//                           ),
//                         )
//                       : SizedBox(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _signIn() async {
//     setState(() {
//       _isSigning = true;
//     });

//     String email = EmailController.text;
//     String password = PasswordController.text;

//     try {
//       UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       setState(() {
//         _isSigning = false;
//       });

//       // User sign-in successful
//       print("Successfully signed in");
//       CustomSnackbar.show(context, 'Sign-In successful',
//           backgroundColor: Colors.green);
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => WelcomeScreen(),
//       //   ),
//       // );
//     } catch (e) {
//       // Handle sign-in failure
//       print("Error signing in: $e");
//       CustomSnackbar.show(context, 'Error during sign-in\n Error: $e',
//           backgroundColor: Colors.red);
//       setState(() {
//         _isSigning = false;
//       });
//     }
//   }
// }
