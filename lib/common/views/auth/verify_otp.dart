import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/utils/validators.dart';
import 'package:attendance_bloc/common/widget/custom_elevated_button.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyOtp extends StatelessWidget {
  static const String routeName = "/verify-otp/";
  VerifyOtp({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final CountdownController _countdownController = CountdownController(
    autoStart: true,
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
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
                  "Verify OTP",
                  style: theme.textTheme.headlineLarge,
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
                        "We have sent One Time Password(OTP code) to your organization email. Please enter the OTP to verify account.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Center(
                              child: Pinput(
                                controller: _otpController,
                                length: 4,
                                onCompleted: (pin) {},
                                keyboardType: TextInputType.number,
                                showCursor: true,
                                cursor: Container(
                                  height: 25,
                                  width: 2,
                                  color: theme.primaryColor,
                                ),
                                defaultPinTheme: PinTheme(
                                  height: width * 0.15,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppColor.lightPink,
                                  ),
                                  textStyle:
                                      theme.textTheme.bodyMedium?.copyWith(color: AppColor.dark),
                                ),
                                errorPinTheme: PinTheme(
                                  height: width * 0.15,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppColor.lightPink,
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                  textStyle:
                                      theme.textTheme.bodyMedium?.copyWith(color: AppColor.dark),
                                ),
                                errorTextStyle:
                                    theme.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
                                enableSuggestions: true,
                                validator: Validators.checkPinField,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Countdown(
                              controller: _countdownController,
                              seconds: 5,
                              build: (BuildContext context, double time) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      time <= 0
                                          ? InkWell(
                                              onTap: () {
                                                _countdownController.restart();
                                              },
                                              child: Text(
                                                "Resend OTP?",
                                                style: theme.textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.pink,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              "Resend the code in $time ",
                                              textAlign: TextAlign.center,
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                              interval: const Duration(seconds: 1),
                              onFinished: () {},
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            CustomElevatedButton(
                              title: "Verify OTP",
                              size: Size(width * 0.5, 50),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (_otpController.value.text == "1111") {
                                    Navigator.of(context);
                                  } else {}
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
