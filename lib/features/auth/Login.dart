// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, must_be_immutable, unused_field, override_on_non_overriding_member, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously, unused_element, unnecessary_null_comparison, unused_local_variable, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/features/auth/Register.dart';
import 'package:wedding_hall_visla/features/auth/auth.dart';
import 'package:wedding_hall_visla/features/auth/forget_password.dart';
import 'package:wedding_hall_visla/widgets/custom_Text_Widget.dart';
import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
import '../../../widgets/CustomPasswordInputField.dart';
import '../../../widgets/CustomSnackbar.dart';
import '../../../widgets/custom_textField.dart';
import '../../constants/validators.dart';
import '../../share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSigning = false;
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthServices authService = FirebaseAuthServices();
  final TextEditingController EmailController = new TextEditingController();
  final TextEditingController PasswordController = new TextEditingController();


  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.WhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*1.1,
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  65.h,
                  Image.asset(
                    "assets/images/banner_2.jpg",
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  40.h,
                  RoundedTextField(
                    hintText: 'Enter Email',
                    labelText: 'Email :',
                    controller: EmailController,
                    validator: validateEmail,
                    inputType: TextInputType.emailAddress,
                  ),
                  20.h,
                  CustomPasswordInputField(
                    controller: PasswordController,
                    hintText: 'Enter password',
                    labelText: 'Password :',
                    validator: (value) => validatePassword(value, EmailController.text),
                  ),
                  10.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
                        },
                        child: const CustomText(
                          text: 'Forget password?',
                          color: globalColors.BlackColor,
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 57,
                    child: RoundButton(
                      title: 'LOGIN',
                      loading: _isSigning,
                      backgroundColor: globalColors.primaryColor,
                      borderSideColor: globalColors.primaryColor,
                      textcolor: globalColors.BlackColor,
                      onPress: () {
                        _signIn();
                      },
                    ),
                  ),
                  20.h,
                  SizedBox(
                    height: 57,
                    child: RoundButton(
                      title: 'REGISTER',
                      backgroundColor: globalColors.primaryColor,
                      borderSideColor: globalColors.primaryColor,
                      textcolor: globalColors.BlackColor,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                      },
                    ),
                  ),
                  20.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isSigning = true;
      });
      String email = EmailController.text;
      String password = PasswordController.text;

      try {
        UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        setState(() {
          _isSigning = false;
        });

        // User sign-in successful
        print("Successfully signed in Wedding Hall Vista");
        CustomSnackbar.show(context, 'Sign-In successful',
            backgroundColor: Colors.green);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomNavigationbar(),
          ),
        );
      } catch (e) {
        // Handle sign-in failure
        print("Error signing in: $e");
        CustomSnackbar.show(context, 'Error during sign-in\n Error: $e',
            backgroundColor: Colors.red);
        setState(() {
          _isSigning = false;
        });
      }
    }
  }
}
