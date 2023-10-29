import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
import 'package:attendance_bloc/Screens/organization/views/organization_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_outline_textfield.dart';
import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/parent_screen.dart';

class AdminPasswordSetupPage extends StatefulWidget {
  static const String routeName = "/admin-password-setup-page";
  const AdminPasswordSetupPage({super.key});

  @override
  State<AdminPasswordSetupPage> createState() => _AdminPasswordSetupPageState();
}

class _AdminPasswordSetupPageState extends State<AdminPasswordSetupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  late AdminDetail adminDetail;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void didChangeDependencies() {
    adminDetail = ModalRoute.of(context)!.settings.arguments as AdminDetail;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Set Password",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        "Set password for your admin account",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    // SizedBox(
                    //   height: height * 0.1,
                    // ),
                    Container(
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            CustomOutlinedTextField(
                              controller: _passwordController,
                              hint: "Password",
                              textInputAction: TextInputAction.next,
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
                              hint: "Confirm Password",
                              controller: _confirmPasswordController,
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
                                    _passwordController.text, value);
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pushNamed(
                                    OrganizationSetupPage.routeName,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: AppColor.dark,
                                  // backgroundColor: ,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                "Create Account",
                                style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.pink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
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
