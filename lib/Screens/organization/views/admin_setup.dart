import 'package:attendance_bloc/Screens/auth/bloc/login_bloc/login_bloc.dart';
import 'package:attendance_bloc/Screens/auth/views/forget_password.dart';
import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_password_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/custom/snackbar.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_elevated_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../../widgets/parent_screen.dart';

class AdminSetupPage extends StatefulWidget {
  static const String routeName = "/admin-setup-page";
  const AdminSetupPage({super.key});

  @override
  State<AdminSetupPage> createState() => _AdminSetupPageState();
}

class _AdminSetupPageState extends State<AdminSetupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Create Admin Account",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.15,
                      ),
                      // Text(
                      //   "Welcome To Aarambha-2.0",
                      //   textAlign: TextAlign.center,
                      //   style: Theme.of(context).textTheme.headlineSmall,
                      // ),
                      // SizedBox(
                      //   height: height * 0.01,
                      // ),
                      Text(
                        "Setup admin account to register your organization",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              hint: "Full Name",
                              controller: _fullNameController,
                              textInputType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [AutofillHints.name],
                              prefixIcon: const Icon(
                                Icons.person_3_rounded,
                                color: AppColor.dark,
                              ),
                              validator: Validators.checkFieldEmpty,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
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
                              height: height * 0.03,
                            ),
                            CustomTextField(
                              hint: "Contact number",
                              controller: _contactNumberController,
                              textInputType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [AutofillHints.telephoneNumber],
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: AppColor.dark,
                              ),
                              validator: Validators.checkPhoneField,
                              maxCharacters: 10,
                            ),
                            // CustomTextField(
                            //   hint: "Password",
                            //   controller: _passwordController,
                            //   textInputAction: TextInputAction.done,
                            //   textInputType: TextInputType.visiblePassword,
                            //   prefixIcon: const Icon(
                            //     Icons.password_rounded,
                            //     color: AppColor.dark,
                            //   ),
                            //   autofillHints: const [AutofillHints.password],
                            //   obscureText: !isVisible,
                            //   suffixIcon: IconButton(
                            //       onPressed: togglePassword,
                            //       icon: isVisible
                            //           ? const Icon(
                            //               Icons.visibility_rounded,
                            //               color: AppColor.dark,
                            //             )
                            //           : const Icon(
                            //               Icons.visibility_off_rounded,
                            //               color: AppColor.dark,
                            //             )),
                            //   validator: Validators.checkPasswordField,
                            // ),
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
                                    title: "Next",
                                    onTap: () {},
                                    size: Size(width * 0.5, 50),
                                    isLoading: true,
                                  );
                                }

                                return CustomElevatedButton(
                                  title: "Next",
                                  size: Size(width * 0.5, 50),
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      // context.read<LoginBloc>().add(
                                      //       SubmitCredentialEvent(
                                      //           userName: _emailController.text,
                                      //           password: _passwordController.text),
                                      //     );
                                      Navigator.of(context).pushNamed(
                                        AdminPasswordSetupPage.routeName,
                                        arguments: AdminDetail(
                                            fullName: _fullNameController.text,
                                            email: _emailController.text,
                                            number: _contactNumberController.text),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.07,
                            ),
                          ],
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

class AdminDetail {
  final String? fullName;
  final String? email;
  final String? number;

  AdminDetail({required this.fullName, required this.email, required this.number});
}
