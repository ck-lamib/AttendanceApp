import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:attendance_bloc/Screens/views/introduction/introduction_page.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(IntroductionPage.routeName, (route) => false);
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
