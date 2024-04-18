// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, must_be_immutable, unused_field, override_on_non_overriding_member, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously, unused_element, unnecessary_null_comparison, unused_local_variable, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/features/auth/auth.dart';
import 'package:wedding_hall_visla/widgets/rounded_btn.dart';
import '../../../widgets/custom_textField.dart';
import '../../constants/validators.dart';
import '../../widgets/CustomSnackbar.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool _isSigning = false;
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthServices authService = FirebaseAuthServices();
  final TextEditingController EmailController = new TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    EmailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.WhiteColor,
      appBar: AppBar(
        backgroundColor: globalColors.WhiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .85,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                RoundedTextField(
                  hintText: 'Enter Email',
                  labelText: 'Email :',
                  controller: EmailController,
                  validator: validateEmail,
                  inputType: TextInputType.emailAddress,
                ),
                Spacer(),
                RoundButton(
                  title: 'Verify Email',
                  loading: _isSigning,
                  backgroundColor: globalColors.primaryColor,
                  borderSideColor: globalColors.primaryColor,
                  textcolor: globalColors.BlackColor,
                  onPress: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await authService
                            .sendPasswordResetEmail(EmailController.text);
                        setState(() {
                          _isSigning = true;
                          Navigator.pop(context);
                        });
                        CustomSnackbar.show(
                            context, 'Password reset email sent successfully',
                            backgroundColor: Colors.green);
                      } catch (e) {
                        CustomSnackbar.show(context, e.toString(),
                            backgroundColor: Colors.red);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

                  