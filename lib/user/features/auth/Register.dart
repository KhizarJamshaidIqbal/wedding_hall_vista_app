// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_element, unused_local_variable, use_build_context_synchronously, avoid_print, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_hall_visla/user/features/auth/Login.dart';
import 'package:wedding_hall_visla/user/features/auth/auth.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
import '../../../../widgets/CustomPasswordInputField.dart';
import '../../../../widgets/CustomSnackbar.dart';
import '../../../../widgets/custom_textField.dart';
import '../../../constants/validators.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final formKey = GlobalKey<FormState>();

  final TextEditingController ConfirmPasswordController =
      new TextEditingController();

  final TextEditingController EmailController = new TextEditingController();

  final TextEditingController PasswordController = new TextEditingController();
  bool isSigningUp = false;

  //   String? validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email Field is required';
  //   }
  //   return null;
  // }

  // String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password Field is required';
  //   }
  //   return null;
  // }

  // String? confirmPasswordValidate(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Confirm Password Field is required';
  //   }

  //   if (value != PasswordController.text) {
  //     return 'Passwords do not match';
  //   }

  //   return null;
  // }

  @override
  void dispose() {
    ConfirmPasswordController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.WhiteColor,
      body: SizedBox(
        // width: double.infinity,
        height: MediaQuery.of(context).size.height * 1.5,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    65.h,
                    Image.asset(
                      "assets/images/banner_1.jpg",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    40.h,
                    RoundedTextField(
                      hintText: 'Enter Email',
                      labelText: 'Email :',
                      controller: EmailController,
                      inputType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                    20.h,
                    CustomPasswordInputField(
                      controller: PasswordController,
                      hintText: 'Enter password',
                      labelText: 'Password :',
                      validator: (value) =>
                          validatePassword(value, EmailController.text),
                    ),
                    20.h,
                    CustomPasswordInputField(
                      controller: ConfirmPasswordController,
                      hintText: 'Enter Confirm password',
                      labelText: 'Confirm Password :',
                      validator: (value) => confirmPasswordValidate(
                          value, PasswordController.text),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 57,
                      child: RoundButton(
                        title: 'SIGN UP',
                        loading: isSigningUp,
                        backgroundColor: globalColors.primaryColor,
                        borderSideColor: globalColors.primaryColor,
                        textcolor: globalColors.BlackColor,
                        onPress: () {
                          _signUp(context);
                        },
                      ),
                    ),
                    // 100.h,
                    const Spacer(), const Spacer(), const Spacer(),
                    const Spacer(), const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isSigningUp = true;
      });
      final String email = EmailController.text;
      final String password = PasswordController.text;

      try {
        // Create the user in Firebase Auth
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Update the user's display name
        userCredential.user!.email;

        // Save user data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'password': password,
        });

        print("User signed up and data saved to Firestore");
        CustomSnackbar.show(
            context, 'Your Successfully SignUp in Wedding Hall Vista App',
            backgroundColor: Colors.green);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print('The email address is already in use.');
          CustomSnackbar.show(context, 'The email address is already in use.',
              backgroundColor: Colors.red);
        } else {
          print("Error signing up or saving data: $e");
          CustomSnackbar.show(context, 'Some Error occurs',
              backgroundColor: Colors.red);
        }
      } catch (e) {
        print("Error signing up or saving data: $e");
        CustomSnackbar.show(context, 'Some Error occurs',
            backgroundColor: Colors.red);
      }

      setState(() {
        isSigningUp = false;
      });
    }
  }
}
