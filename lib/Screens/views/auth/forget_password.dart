import 'package:attendance_bloc/utils/helpers/validators.dart';
import 'package:attendance_bloc/Screens/views/auth/verify_otp.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_elevated_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../../widgets/parent_screen.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routeName = "/forget-password-page";
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AppBar(
                scrolledUnderElevation: 0,
                title: Text(
                  "Forget Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Text(
                        "Enter your email with organization name to reset your Password ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const CustomTextField(
                              hint: "Organization Email",
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
                              hint: "Your Organization",
                              textInputAction: TextInputAction.done,
                              controller: TextEditingController(text: "Aarambha It"),
                              readOnly: true,
                              textInputType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(
                                Icons.apartment_sharp,
                                color: AppColor.dark,
                              ),
                              validator: Validators.checkFieldEmpty,
                              onTap: () {
                                Future.delayed(const Duration(seconds: 3), () {
                                  setState(() {
                                    isLoaded = !isLoaded;

                                    Navigator.of(context).pop();
                                    isLoaded
                                        ? showDialog(
                                            context: context,
                                            builder: (contextt) {
                                              return AlertDialog(
                                                insetPadding: const EdgeInsets.all(64.0),
                                                content: SizedBox(
                                                  width: 200,
                                                  child: ListView.builder(
                                                    itemCount: 20,
                                                    shrinkWrap: true,
                                                    itemBuilder: (context, int index) {
                                                      return ListTile(
                                                        title: Text(index.toString()),
                                                        onTap: () {
                                                          Navigator.pop(context, index);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            })
                                        : null;
                                  });
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: const EdgeInsets.all(64.0),
                                        content: SizedBox(
                                          width: 200,
                                          child: Center(
                                            child: SizedBox(
                                              height: width * 0.12,
                                              width: width * 0.12,
                                              child: const CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            CustomElevatedButton(
                              title: "Reset Password",
                              size: Size(width * 0.5, 50),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pushNamed(VerifyOtpPage.routeName);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
