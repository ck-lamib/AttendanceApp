import 'dart:math';

import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/widget/pick_image.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_profile_page.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demoProfile/demo_view_organization.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_home_page.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_report.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_request.dart';
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
    const DemoProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              icon: Icon(Icons.settings),
              label: "Setting",
              tooltip: "Setting",
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const TransformCrossIcon()
      // PopUpNavigation()
      ,
    );
  }
}

class TransformCrossIcon extends StatefulWidget {
  const TransformCrossIcon({super.key});

  @override
  State<TransformCrossIcon> createState() => _TransformCrossIconState();
}

class _TransformCrossIconState extends State<TransformCrossIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: pi / 4).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return IconButton(
        onPressed: () {
          _controller.forward();
          var numberDialog = Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.15,
              // left: width * 0.22,
              // right: width * 0.22,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    // minHeight: 20,
                    maxHeight: width * 0.55,
                    // minWidth: 20,
                    maxWidth: width * 0.55,
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: width * 0.03,
                    mainAxisSpacing: width * 0.03,
                    crossAxisCount: 2,
                    children: [
                      ShortCutTile(
                        isNavShortcut: true,
                        icon: const Icon(Icons.analytics_outlined),
                        iconName: "Report",
                        onTap: () {
                          Navigator.of(context).pushNamed(DemoLeaveReportPage.routeName);
                        },
                      ),
                      ShortCutTile(
                        isNavShortcut: true,
                        icon: const Icon(Icons.work_history_rounded),
                        iconName: "Leave",
                        onTap: () {
                          Navigator.of(context).pushNamed(DemoLeaveRequestPage.routeName);
                        },
                      ),
                      ShortCutTile(
                          isNavShortcut: true,
                          icon: const Icon(Icons.apartment_sharp),
                          iconName: "Organization",
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              DemoViewOrganizationDetail.routeName,
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return numberDialog;
            },
          ).whenComplete(() => _controller.reverse());
        },
        icon: ConstrainedBox(
          constraints:
              const BoxConstraints(maxHeight: 100, minHeight: 20, minWidth: 20, maxWidth: 100),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffFBE9FF),
              border: Border.all(width: 1, color: AppColor.dark),
              // boxShadow: [BoxShadow(color: AppColor.dark, spreadRadius: 5, blurRadius: 10)],
            ),
            child: AnimatedBuilder(
                animation: _controller,
                builder: ((context, child) {
                  return Transform.rotate(
                    angle: animation.value,
                    child: const Icon(
                      Icons.add,
                      color: AppColor.main,
                      size: 40,
                    ),
                  );
                })),
          ),
        ));
  }
}
