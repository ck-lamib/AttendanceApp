import 'package:attendance_bloc/Screens/auth/views/login_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_outline_textfield.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_elevated_button.dart';
import '../../widgets/parent_screen.dart';

class VerifyEmailLoginPage extends StatefulWidget {
  static const String routeName = "/verify-email-login-page";
  const VerifyEmailLoginPage({super.key});

  @override
  State<VerifyEmailLoginPage> createState() => _VerifyEmailLoginPageState();
}

class _VerifyEmailLoginPageState extends State<VerifyEmailLoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Verify your email to get started",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: width * 0.1),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: AppColor.lightPink.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 2,
                            color: const Color(0xffF8DAFF).withOpacity(0.3),
                          )
                        ]),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomOutlinedTextField(
                            hint: "Email",
                            controller: _emailController,
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
                            height: height * 0.03,
                          ),
                          CustomElevatedButton(
                            backGroundColor: AppColor.dark,
                            title: "Verify Email",
                            textColor: AppColor.lightPink,
                            size: Size(width * 0.5, 50),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                // context.read<LoginBloc>().add(
                                //       SubmitCredentialEvent(
                                //           userName: _emailController.text,
                                //           password: _passwordController.text),
                                //     );
                                Navigator.of(context).pushNamed(LoginPage.routeName);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
