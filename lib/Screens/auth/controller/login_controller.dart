import 'package:attendance_bloc/Screens/auth/domain/usecase/login_usecase.dart';
import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/Screens/widgets/custom/snackbar.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //toggling password
  var isPasswordHidden = true.obs;
  onTogglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  //button loading
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;

  Future<ResponseData> onLoginSubmit() async {
    _loading.value = true;
    ResponseData responseData = ResponseData();
    try {
      var result = await locator<LoginUsecase>().loginUser(
        email: emailController.text,
        password: passwordController.text,
      );
      CustomLogger.trace(result);
      result.fold((error) {
        responseData = ResponseData(
          message: error.message,
          responseStatus: ResponseStatus.error,
        );
      }, (data) {
        CustomLogger.trace(data);
        responseData = ResponseData(
          message: "Success",
          responseStatus: ResponseStatus.success,
        );
      });
    } catch (e) {
      CustomLogger.trace(e);
      responseData = ResponseData(
        message: "Exception occured",
        responseStatus: ResponseStatus.error,
      );
    }

    _loading.value = false;
    return responseData;
  }
}
