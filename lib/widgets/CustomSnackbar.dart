// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message,
      {required backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
