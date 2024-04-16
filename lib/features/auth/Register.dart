// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_element, unused_local_variable, use_build_context_synchronously, avoid_print, unused_field

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wedding_hall_visla/features/auth/Login.dart';
// import 'package:wedding_hall_visla/features/auth/auth.dart';
// import 'package:wedding_hall_visla/constants/app_size.dart';
// import 'package:wedding_hall_visla/constants/colors.dart';
// import 'package:wedding_hall_visla/constants/fonts.dart';
// import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';
// import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
// import '../../../widgets/CustomPasswordInputField.dart';
// import '../../../widgets/CustomSnackbar.dart';
// import '../../../widgets/custom_textField.dart';

// class Register extends StatefulWidget {
//   Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final FirebaseAuthServices _auth = FirebaseAuthServices();

//   final formKey = GlobalKey<FormState>();
//   String? validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Name Field is required';
//     }
//     return null;
//   }

//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email Field is required';
//     }
//     return null;
//   }

//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password Field is required';
//     }
//     return null;
//   }

//   final TextEditingController NameController = new TextEditingController();

//   final TextEditingController EmailController = new TextEditingController();

//   final TextEditingController PasswordController = new TextEditingController();
//   bool isSigningUp = false;
//   @override
//   void dispose() {
//     NameController.dispose();
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
//         height: MediaQuery.of(context).size.height * 1,
//         decoration: const BoxDecoration(gradient: globalColors.primaryGradient),
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 1,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     60.h,
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 35,
//                         color: globalColors.TitleColor,
//                       ),
//                     ),
//                     40.h,
//                     CustomText(
//                       text: 'Register With Email',
//                       color: globalColors.TitleColor,
//                       fontsize: 20,
//                       fontFamily: fonts.fontfamily_1,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     5.h,
//                     CustomText(
//                       text:
//                           'Join the Pakistan Currency Scanning and Detection Community for beginning your journey to secure your currency verification.',
//                       color: globalColors.DescriptionColor,
//                       fontsize: 14,
//                       fontFamily: fonts.fontfamily_1,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     35.h,
//                     RoundedTextField(
//                       hintText: 'Enter Your Name here...',
//                       labelText: 'Name',
//                       icon: Icon(
//                         Icons.person_outline,
//                         color: globalColors.TitleColor,
//                         size: 28,
//                       ),
//                       controller: NameController,
//                       inputType: TextInputType.name,
//                       validator: validateName,
//                     ),
//                     20.h,
//                     RoundedTextField(
//                       hintText: 'Type Email Address here...',
//                       labelText: 'Email Address',
//                       icon: Icon(
//                         Icons.email_outlined,
//                         color: globalColors.TitleColor,
//                         size: 28,
//                       ),
//                       controller: EmailController,
//                       inputType: TextInputType.emailAddress,
//                       validator: validateEmail,
//                     ),
//                     20.h,
//                     CustomPasswordInputField(
//                       controller: PasswordController,
//                       hintText: 'Enter new password here...',
//                       labelText: 'Password',
//                       validator: validatePassword,
//                     ),
//                     const Spacer(),
//                     RoundButton(
//                         title: 'Continue',
//                         loading: isSigningUp,
//                         onPress: () {
//                           _signUp(context);
//                         }),
//                     10.h,
//                     Row(
//                       children: [
//                         const Spacer(),
//                         const CustomText(
//                           text: 'Already have an account?',
//                           color: globalColors.TitleColor,
//                           fontsize: 18,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Literata-SemiBold',
//                         ),
//                         5.w,
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Login(),
//                                 ));
//                           },
//                           child: const CustomText(
//                               text: 'Login',
//                               color: globalColors.TitleColor,
//                               fontsize: 18,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: fonts.fontfamily_1,
//                               textDecoration: TextDecoration.underline),
//                         ),
//                         const Spacer(),
//                       ],
//                     ),
//                     20.h,
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void _signUp(BuildContext context) async {
//   if (formKey.currentState!.validate()) {
//     setState(() {
//       isSigningUp = true;
//     });

//     final String name = NameController.text;
//     final String email = EmailController.text;
//     final String password = PasswordController.text;

//     try {
//       // Create the user in Firebase Auth
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Update the user's display name
//       await userCredential.user!.updateDisplayName(name);

//       // Save user data to Firestore
//       await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//         'name': name,
//         'email': email,
//       });

//       print("User signed up and data saved to Firestore");
//       CustomSnackbar.show(context, 'Your Successfully SignUp in Pakistan Currency Scanning And Detection App', backgroundColor: Colors.green);

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Login(),
//         ),
//       );
//     } catch (e) {
//       print("Error signing up or saving data: $e");
//       CustomSnackbar.show(context, 'Some Error occurs', backgroundColor: Colors.red);
//     }

//     setState(() {
//       isSigningUp = false;
//     });
//   }
// }

// }
