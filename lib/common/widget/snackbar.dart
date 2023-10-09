import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static show({
    required BuildContext context,
    required CustomSnackbarType customSnackbarType,
    String? title,
    String? message,
    int duration = 3,
  }) {
    return Flushbar(
      title: title ??
          (customSnackbarType == CustomSnackbarType.success
              ? "Successful"
              : customSnackbarType == CustomSnackbarType.error
                  ? "Error!"
                  : "Info"),
      message: message ??
          (customSnackbarType == CustomSnackbarType.success
              ? "The action was successful!"
              : customSnackbarType == CustomSnackbarType.error
                  ? "Unknown error! Please try again later!"
                  : "Something went wrong"),
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: customSnackbarType == CustomSnackbarType.success
          ? const Icon(Icons.check_circle_outline_rounded)
          : customSnackbarType == CustomSnackbarType.error
              ? const Icon(Icons.error_outline_rounded)
              : const Icon(Icons.info_outline_rounded),
      borderRadius: BorderRadius.circular(15),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: customSnackbarType.color,
    )..show(context);
  }
}

enum CustomSnackbarType {
  error(Colors.red),

  success(Colors.green),
  info(Colors.deepOrangeAccent);

  final Color color;

  const CustomSnackbarType(this.color);
}
