import 'package:attendance_bloc/Screens/auth/views/change_password.dart';
import 'package:attendance_bloc/Screens/auth/views/forget_password.dart';
import 'package:attendance_bloc/Screens/auth/views/login_page.dart';
import 'package:attendance_bloc/Screens/auth/views/verify_otp.dart';
import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/report_bug.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/user_detail_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/view_organization_page.dart';
import 'package:attendance_bloc/Screens/introduction/views/introduction_page.dart';
import 'package:attendance_bloc/Screens/leave/views/leave_report_page.dart';
import 'package:attendance_bloc/Screens/leave/views/leave_request_page.dart';
import 'package:attendance_bloc/Screens/member/views/view_members.dart';
import 'package:attendance_bloc/Screens/notification/views/notification_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
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
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //auth app route
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
    case ChangePasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ChangePasswordPage(),
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

    //dashboard-profile
    case DashboardPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardPage(),
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

    case ProfileDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileDetailPage(),
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

    //introduction
    case IntroductionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IntroductionPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //leave
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

    //member
    case MemberDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MemberDetailPage(),
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

    //notification
    case NotificationPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const NotificationPage(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //organization
    case AdminSetupPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AdminSetupPage(),
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