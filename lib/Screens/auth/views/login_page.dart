import 'package:attendance_bloc/Screens/auth/controller/login_controller.dart';
import 'package:attendance_bloc/Screens/auth/views/forget_password.dart';
import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/snackbar.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_elevated_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../../widgets/parent_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login-page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController c = locator.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Login your account to get started",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  AutofillGroup(
                    child: Form(
                      key: c.formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: "Email",
                            controller: c.emailController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColor.dark,
                            ),
                            validator: Validators.checkEmailField,
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Obx(
                            () => CustomTextField(
                              hint: "Password",
                              controller: c.passwordController,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(
                                Icons.password_rounded,
                                color: AppColor.dark,
                              ),
                              autofillHints: const [AutofillHints.password],
                              obscureText: c.isPasswordHidden.value,
                              suffixIcon: IconButton(
                                onPressed: c.onTogglePassword,
                                icon: c.isPasswordHidden.value
                                    ? const Icon(
                                        Icons.visibility_rounded,
                                        color: AppColor.dark,
                                      )
                                    : const Icon(
                                        Icons.visibility_off_rounded,
                                        color: AppColor.dark,
                                      ),
                              ),
                              validator: Validators.checkPasswordField,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Obx(
                            () => CustomElevatedButton(
                              title: "Login",
                              size: Size(width * 0.5, 50),
                              isLoading: c.loading,
                              onTap: () async {
                                if (c.formKey.currentState!.validate()) {
                                  TextInput.finishAutofillContext();
                                  ResponseData responseData = await c.onLoginSubmit();
                                  if (responseData.responseStatus == ResponseStatus.success) {
                                    if (context.mounted) {
                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                          DashboardPage.routeName, (route) => false);
                                      CustomSnackBar.show(
                                        context: context,
                                        customSnackbarType: CustomSnackbarType.success,
                                        title: "Login Success",
                                      );
                                    }
                                  } else {
                                    if (context.mounted) {
                                      CustomSnackBar.show(
                                        context: context,
                                        customSnackbarType: CustomSnackbarType.error,
                                        title: "Login Failure",
                                        message: responseData.message,
                                      );
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.07,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    ForgetPasswordPage.routeName, (route) => false);
                              },
                              child: Text(
                                "Forget Your Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "OR",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AdminSetupPage.routeName);
                              },
                              child: Text(
                                "Setup Organization?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
