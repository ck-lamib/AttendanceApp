import 'dart:math';

import 'package:attendance_bloc/Screens/dashboard/home/views/home_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/profile_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/view_organization_page.dart';
import 'package:attendance_bloc/Screens/leave/views/leave_report_page.dart';
import 'package:attendance_bloc/Screens/leave/views/leave_request_page.dart';
import 'package:attendance_bloc/Screens/widgets/pick_image.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = "/dashboard-page";
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  PageController pageController = PageController();
  var pageList = [
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: const TransformCrossIcon()),
      // PopUpNavigation()
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
    // var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return IconButton(
        onPressed: () {
          _controller.forward();
          var numberDialog = Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * 0.15,
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
                          Navigator.of(context).pushNamed(LeaveReportPage.routeName);
                        },
                      ),
                      ShortCutTile(
                        isNavShortcut: true,
                        icon: const Icon(Icons.work_history_rounded),
                        iconName: "Leave",
                        onTap: () {
                          Navigator.of(context).pushNamed(LeaveRequestPage.routeName);
                        },
                      ),
                      ShortCutTile(
                          isNavShortcut: true,
                          icon: const Icon(Icons.apartment_sharp),
                          iconName: "Organization",
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ViewOrganizationDetailPage.routeName,
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
