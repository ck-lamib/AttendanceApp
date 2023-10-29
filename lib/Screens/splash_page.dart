import 'package:attendance_bloc/Screens/auth/views/login_page.dart';
import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/introduction/views/introduction_page.dart';
import 'package:attendance_bloc/core/core_controller.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:flutter/material.dart';

import 'widgets/parent_screen.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splash-page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  navigate() {
    Future.delayed(const Duration(seconds: 3), () async {
      CoreController cc = locator.get<CoreController>();
      if (cc.isUserLoggedIn()) {
        Navigator.of(context).pushNamedAndRemoveUntil(DashboardPage.routeName, (route) => false);
      } else {
        var isIntroductionPageShown = await cc.isIntroductionPageShown();
        if (isIntroductionPageShown) {
          if (context.mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
          }
        } else {
          if (context.mounted) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(IntroductionPage.routeName, (route) => false);
          }
        }
      }
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ParentScreen(
          child: Center(child: Image.asset(ImagePath.splashImagePath)),
        ),
      ),
    );
  }
}
