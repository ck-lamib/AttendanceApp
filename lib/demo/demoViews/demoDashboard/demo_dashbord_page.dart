import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/widget/custom_navbar_circle.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_profile_page.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_home_page.dart';
import 'package:flutter/material.dart';

class DemoDashboardPage extends StatefulWidget {
  static const String routeName = "/demo-dashboard-page";
  const DemoDashboardPage({super.key});

  @override
  State<DemoDashboardPage> createState() => _DemoDashboardPageState();
}

class _DemoDashboardPageState extends State<DemoDashboardPage> {
  int currentIndex = 0;
  PageController pageController = PageController();
  var pageList = [
    const DemoHomePage(),
    DemoProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
              pageController.jumpToPage(currentIndex);
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_4_rounded),
              label: "Profile",
              tooltip: "Profile",
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IconButton(
          onPressed: () {},
          icon: ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 100, minHeight: 20, minWidth: 20, maxWidth: 100),
            child: CustomPaint(
              painter: CirclePainter(),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFBE9FF),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColor.main,
                  size: 40,
                ),
              ),
            ),
          )),
    );
  }
}
