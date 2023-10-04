import 'package:attendance_bloc/common/views/auth/forget_password.dart';
import 'package:attendance_bloc/common/views/auth/login_page.dart';
import 'package:attendance_bloc/common/views/auth/verify_otp.dart';
import 'package:attendance_bloc/common/views/introduction_page.dart';
import 'package:attendance_bloc/common/views/splash_page.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_profile_detail.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_dashbord_page.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_home_page.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color dark = Color(0xff5A2B66);
  static const Color main = Color(0xff913D88);
  static const Color lightPink = Color(0xffF8DAFF);
  static const Color pink = Color(0xffF0B5FF);
  static const backgroundBlackColor = Color(0xff1E1E1E);
}

var appRoute = {
  //common app route
  SplashPage.routeName: (_) => const SplashPage(),
  IntroductionPage.routeName: (_) => const IntroductionPage(),
  LoginPage.routeName: (_) => const LoginPage(),
  ForgetPassword.routeName: (_) => ForgetPassword(),
  VerifyOtp.routeName: (_) => VerifyOtp(),

  //demo app route
  DemoDashboardPage.routeName: (_) => DemoDashboardPage(),
  DemoProfileDetailPage.routeName: (_) => DemoProfileDetailPage(),
};



// @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: ParentScreen(
//           child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
              
//             ],
//           ),
//         ),
//       )),
//     );
//   }