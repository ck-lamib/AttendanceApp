import 'dart:developer';

class CustomLogger {
  static trace(Object? message, {Object? error}) {
    log("".padLeft(15, "<<=>>"));
    log(" ");
    log(
      message.toString(),
      error: error,
    );
    log(" ");
    log("".padLeft(15, "<<=>>"));
  }
}
