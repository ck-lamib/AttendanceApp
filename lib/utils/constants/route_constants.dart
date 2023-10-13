import 'package:attendance_bloc/Screens/views/auth/demo_change_password.dart';
import 'package:attendance_bloc/Screens/views/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/views/dashboard/profile/user_detail_page.dart';
import 'package:attendance_bloc/Screens/views/dashboard/profile/view_organization_page.dart';
import 'package:attendance_bloc/Screens/views/leave/leave_report_page.dart';
import 'package:attendance_bloc/Screens/views/leave/leave_request_page.dart';
import 'package:attendance_bloc/Screens/views/member/demo_view_members.dart';
import 'package:attendance_bloc/Screens/views/notification/notification_page.dart';
import 'package:attendance_bloc/Screens/views/auth/forget_password.dart';
import 'package:attendance_bloc/Screens/views/auth/login_page.dart';
import 'package:attendance_bloc/Screens/views/auth/verify_otp.dart';
import 'package:attendance_bloc/Screens/views/introduction/introduction_page.dart';
import 'package:attendance_bloc/Screens/views/dashboard/profile/report_bug.dart';
import 'package:attendance_bloc/Screens/splash_page.dart';
import 'package:flutter/material.dart';

import '../../Screens/widgets/member_detail_page.dart';

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
    case ForgetPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgetPasswordPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case VerifyOtpPage.routeName:
      return MaterialPageRoute(
        builder: (_) => VerifyOtpPage(),
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
    case ReportBugPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ReportBugPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //demo app route
    case DashboardPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ProfileDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileDetailPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case LeaveRequestPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LeaveRequestPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case LeaveReportPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LeaveReportPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case NotificationPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const NotificationPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ChangePasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ChangePasswordPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ViewMember.routeName:
      return MaterialPageRoute(
        builder: (_) => const ViewMember(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case ViewOrganizationDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ViewOrganizationDetailPage(),
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