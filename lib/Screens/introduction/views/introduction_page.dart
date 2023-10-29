import 'package:attendance_bloc/Screens/auth/views/login_page.dart';
import 'package:attendance_bloc/Screens/widgets/introduction_tile.dart';
import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/datasource/local/local_extra_storage_service.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class IntroductionPage extends StatefulWidget {
  static const String routeName = "/introduction-page";
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final List introList = [
    IntroductionTile(
      image: Image.asset(ImagePath.introductionPageImagePath),
      introductionScreenTitle: "Make Attendance",
      introductionScreenDesc: "Check in or check out daily  through our app.",
    ),
    IntroductionTile(
      image: Image.asset(ImagePath.introductionPageImagePath),
      introductionScreenTitle: "Make Attendance2",
      introductionScreenDesc: "Check in or check out daily  through our app.",
    ),
    IntroductionTile(
      image: Image.asset(ImagePath.introductionPageImagePath),
      introductionScreenTitle: "Make Attendance3",
      introductionScreenDesc: "Check in or check out daily  through our app.",
    ),
  ];

  PageController pageController = PageController();

  int dotIndicatorPage = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              DotsIndicator(
                onTap: (value) {
                  pageController.animateToPage(value,
                      duration: const Duration(milliseconds: 250), curve: Curves.ease);
                },
                dotsCount: 3,
                position: dotIndicatorPage,
                decorator: DotsDecorator(
                  size: Size(width / 4, 8),
                  activeSize: Size(width / 4, 8),
                  color: AppColor.lightPink,
                  activeColor: AppColor.main,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      dotIndicatorPage = value;
                    });
                  },
                  children: [...introList],
                ),
              ),
            ],
          ),
        ),
      )),
      floatingActionButton: GestureDetector(
        onTap: () async {
          if (pageController.page! >= (introList.length - 1)) {
            await locator.get<LocalExtraStorageService>().saveIntroductionKeyShown(true);
            if (context.mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
            }
          } else {
            setState(() {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 250), curve: Curves.ease);
            });
          }
        },
        child: Container(
          height: width * 0.15,
          width: width * 0.15,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.pink,
          ),
          child: const ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.main,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
