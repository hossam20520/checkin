
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'color_constant.dart';

class CustomSnackbar {
  static void showSnackbar(
      {required BuildContext context,
        required String message,
        SnackPosition snackPosition = SnackPosition.TOP,
        Color backgroundColor = Colors.red,
        EdgeInsets margin = const EdgeInsets.all(20.0),
        double borderRadius = 10,
        Duration animationDuration = const Duration(seconds: 1),
        required Icon icon}) {
    final snackbar = SnackBar(
      content: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(message),
        ],
      ),
      backgroundColor: backgroundColor,
      margin: margin,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      duration: animationDuration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}