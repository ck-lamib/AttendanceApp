import 'package:attendance_bloc/common/views/auth/forget_password.dart';
import 'package:attendance_bloc/common/views/auth/login_page.dart';
import 'package:attendance_bloc/common/views/auth/verify_otp.dart';
import 'package:attendance_bloc/common/views/introduction_page.dart';
import 'package:attendance_bloc/common/views/report_bug.dart';
import 'package:attendance_bloc/common/views/splash_page.dart';
import 'package:attendance_bloc/common/widget/member_detail_page.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_change_password.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_profile_detail.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_view_organization.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_dashbord_page.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_report.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_request.dart';
import 'package:attendance_bloc/demo/demoViews/demo_notification.dart';
import 'package:attendance_bloc/demo/demoViews/demo_view_members.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color dark = Color(0xff5A2B66);
  static const Color main = Color(0xff913D88);
  static const Color lightPink = Color(0xffF8DAFF);
  static const Color pink = Color(0xffF0B5FF);
  static const backgroundBlackColor = Color(0xff1E1E1E);
}

// var appRoute = {
//   //common app route
//   SplashPage.routeName: (_) => const SplashPage(),
//   IntroductionPage.routeName: (_) => const IntroductionPage(),
//   LoginPage.routeName: (_) => const LoginPage(),
//   ForgetPassword.routeName: (_) => ForgetPassword(),
//   VerifyOtp.routeName: (_) => VerifyOtp(),

//   //demo app route
//   DemoDashboardPage.routeName: (_) => DemoDashboardPage(),
//   DemoProfileDetailPage.routeName: (_) => DemoProfileDetailPage(),
//   DemoLeaveRequestPage.routeName: (_) => DemoLeaveRequestPage(),
//   DemoLeaveReportPage.routeName: (_) => DemoLeaveReportPage(),
// };

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //common app route
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case IntroductionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IntroductionPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ForgetPassword.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgetPassword(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case VerifyOtp.routeName:
      return MaterialPageRoute(
        builder: (_) => VerifyOtp(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case MemberDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MemberDetailPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ReportBug.routeName:
      return MaterialPageRoute(
        builder: (_) => const ReportBug(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //demo app route
    case DemoDashboardPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoDashboardPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoProfileDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoProfileDetailPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoLeaveRequestPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoLeaveRequestPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoLeaveReportPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoLeaveReportPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoNotificationPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoNotificationPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoChangePasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoChangePasswordPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoViewMember.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoViewMember(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case DemoViewOrganizationDetail.routeName:
      return MaterialPageRoute(
        builder: (_) => const DemoViewOrganizationDetail(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}


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