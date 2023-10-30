import 'package:attendance_bloc/Screens/auth/bloc/login_bloc/login_bloc.dart';
import 'package:attendance_bloc/Screens/auth/views/forget_password.dart';
import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/snackbar.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
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
                            height: height * 0.05,
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return CustomTextField(
                                hint: "Password",
                                controller: _passwordController,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefixIcon: const Icon(
                                  Icons.password_rounded,
                                  color: AppColor.dark,
                                ),
                                autofillHints: const [AutofillHints.password],
                                obscureText: state.isPasswordHidden,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(TooglePasswordEvent(
                                          isHidePassword: state.isPasswordHidden));
                                    },
                                    icon: !state.isPasswordHidden
                                        ? const Icon(
                                            Icons.visibility_rounded,
                                            color: AppColor.dark,
                                          )
                                        : const Icon(
                                            Icons.visibility_off_rounded,
                                            color: AppColor.dark,
                                          )),
                                validator: Validators.checkPasswordField,
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state.status == LoginStatus.error) {
                                CustomSnackBar.show(
                                  context: context,
                                  customSnackbarType: CustomSnackbarType.error,
                                  title: "Login failed",
                                  message: "Login failed. Please try again",
                                );
                              } else if (state.status == LoginStatus.success) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    DashboardPage.routeName, (route) => false);
                                CustomSnackBar.show(
                                  context: context,
                                  customSnackbarType: CustomSnackbarType.success,
                                  title: "Login success",
                                  message: "Logged in successfully",
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state.status == LoginStatus.loading) {
                                return CustomElevatedButton(
                                  title: "Login",
                                  onTap: () {},
                                  size: Size(width * 0.5, 50),
                                  isLoading: true,
                                );
                              }

                              return CustomElevatedButton(
                                title: "Login",
                                size: Size(width * 0.5, 50),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    TextInput.finishAutofillContext();
                                    context.read<LoginBloc>().add(
                                          SubmitCredentialEvent(
                                              userName: _emailController.text,
                                              password: _passwordController.text),
                                        );
                                    // Navigator.of(context).pushNamedAndRemoveUntil(
                                    //     DashboardPage.routeName, (route) => false);
                                  }
                                },
                              );
                            },
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
