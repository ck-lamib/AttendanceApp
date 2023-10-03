import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/utils/validators.dart';
import 'package:attendance_bloc/common/views/auth/forget_password.dart';
import 'package:attendance_bloc/common/widget/custom_elevated_button.dart';
import 'package:attendance_bloc/common/widget/custom_textfield.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_dashbord_page.dart';
import 'package:attendance_bloc/demo/demoViews/demo_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login-page/";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                      key: formKey,
                      child: Column(
                        children: [
                          const CustomTextField(
                            hint: "Email",
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.email],
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColor.dark,
                            ),
                            validator: Validators.checkEmailField,
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          CustomTextField(
                            hint: "Password",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                              color: AppColor.dark,
                            ),
                            autofillHints: const [AutofillHints.password],
                            obscureText: !isVisible,
                            suffixIcon: IconButton(
                                onPressed: togglePassword,
                                icon: isVisible
                                    ? const Icon(
                                        Icons.visibility_rounded,
                                        color: AppColor.dark,
                                      )
                                    : const Icon(
                                        Icons.visibility_off_rounded,
                                        color: AppColor.dark,
                                      )),
                            validator: Validators.checkPasswordField,
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          CustomElevatedButton(
                            title: "Login",
                            size: Size(width * 0.5, 50),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                TextInput.finishAutofillContext();
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.07,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(ForgetPassword.routeName);
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
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    DemoDashboardPage.routeName, (route) => false);
                              },
                              child: Text(
                                "Try Demo?",
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

  togglePassword() {
    isVisible = !isVisible;
    setState(() {});
  }
}
