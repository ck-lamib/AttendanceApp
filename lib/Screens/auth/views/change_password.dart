import 'package:attendance_bloc/utils/helpers/validators.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_app_bar.dart';
import '../../widgets/custom/custom_outline_textfield.dart';
import '../../widgets/parent_screen.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String routeName = "/change-password-page";
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isOldPasswordVisible = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Change Password",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: width * 0.1),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 2,
                            color: const Color(0xffF8DAFF).withOpacity(0.5),
                          )
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        CustomOutlinedTextField(
                          hint: "Old Password",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            color: AppColor.dark,
                          ),
                          autofillHints: const [AutofillHints.password],
                          obscureText: !isOldPasswordVisible,
                          suffixIcon: IconButton(
                              onPressed: toggleOldPassword,
                              icon: isOldPasswordVisible
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
                          height: height * 0.03,
                        ),
                        CustomOutlinedTextField(
                          controller: newPasswordController,
                          hint: "New Password",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            color: AppColor.dark,
                          ),
                          autofillHints: const [AutofillHints.password],
                          obscureText: !isPasswordVisible,
                          suffixIcon: IconButton(
                              onPressed: tooglePassword,
                              icon: isPasswordVisible
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
                          height: height * 0.03,
                        ),
                        CustomOutlinedTextField(
                          hint: "Retype New Password",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            color: AppColor.dark,
                          ),
                          autofillHints: const [AutofillHints.password],
                          obscureText: !isConfirmPasswordVisible,
                          suffixIcon: IconButton(
                              onPressed: toggleConfirmPassword,
                              icon: isConfirmPasswordVisible
                                  ? const Icon(
                                      Icons.visibility_rounded,
                                      color: AppColor.dark,
                                    )
                                  : const Icon(
                                      Icons.visibility_off_rounded,
                                      color: AppColor.dark,
                                    )),
                          validator: (value) {
                            return Validators.checkConfirmPassword(
                                newPasswordController.text, value);
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: AppColor.dark,
                              // backgroundColor: ,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            "Change password",
                            style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.pink),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  toggleOldPassword() {
    isOldPasswordVisible = !isOldPasswordVisible;
    setState(() {});
  }

  tooglePassword() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }

  toggleConfirmPassword() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    setState(() {});
  }
}
