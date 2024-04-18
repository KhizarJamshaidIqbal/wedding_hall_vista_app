// ignore_for_file: unused_field, avoid_print, dead_code, prefer_final_fields, unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/features/auth/UserModel.dart';

import '../../widgets/CustomSnackbar.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUpWithEmailAndPassword(
      UserModel userModel, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'email': userModel.email,
        'password': userModel.password,
        // Add additional fields as needed
      });

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email address is already in use.');
        CustomSnackbar.show(context, 'The email address is already in use.',
            backgroundColor: Colors.red);
        // You can handle the error here, e.g., show a message to the user
        // or navigate to a different screen
      } else {
        print('An error occurred: ${e.code}');
      }
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // showToast(message: 'Invalid email or password.');
        print('Invalid email or password.');
      } else {
        // showToast(message: 'An error occurred: ${e.code}');
        print(e.code);
      }
    }
    return null;
  }

  //sendPasswordResetEmail
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      await user?.delete();
    } catch (e) {
      print('Error deleting account: $e');
    }
  }
}
