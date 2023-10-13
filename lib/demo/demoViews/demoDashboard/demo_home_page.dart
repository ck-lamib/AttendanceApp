import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/utils/extension.dart';
import 'package:attendance_bloc/common/widget/activity_tile.dart';
import 'package:attendance_bloc/common/widget/clock_detail.dart';
import 'package:attendance_bloc/common/widget/feature_tile.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_report.dart';
import 'package:attendance_bloc/demo/demoViews/demo_leave_request.dart';
import 'package:attendance_bloc/demo/demoViews/demo_notification.dart';
import 'package:attendance_bloc/demo/demoViews/demo_view_members.dart';
import 'package:flutter/material.dart';

class DemoHomePage extends StatelessWidget {
  static const String routeName = "/demo-home-page/";
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
        child: SafeArea(
          child: CustomScrollView(slivers: [
            // A flexible app bar
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome Back 👋",
                            style: theme.textTheme.headlineLarge?.copyWith(color: Colors.white),
                          ),
                          Text(
                            "Bimal Khatri !",
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(color: AppColor.lightPink),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 2,
                              color: const Color(0xffF8DAFF).withOpacity(0.42),
                            )
                          ],
                          color: AppColor.main),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(360),
                        onTap: () {
                          Navigator.of(context).pushNamed(DemoNotificationPage.routeName);
                        },
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: AppColor.lightPink,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pinned: false,
              collapsedHeight: height * 0.15,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.main,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: const Color(0xffF8DAFF).withOpacity(0.42),
                            )
                          ]),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Current Time",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const ClockDetails(
                                is24hr: false,
                                showSecond: false,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("[${DateTime.now().toString().split(" ").first}]",
                                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        fontFamily: "Technology",
                                        fontSize: 20,
                                      )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Text(
                      "Today's Activity",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: AppColor.pink,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ActivityTile(
                      title: "Last Check in time",
                      time: DateTime.now().getDate(),
                      buttonText: "Check out",
                      buttonAction: null,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ActivityTile(
                      title: "Last Check out time",
                      time: DateTime.now().getDate(),
                      buttonText: "Check In",
                      buttonAction: null,
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Text(
                      "App Features",
                      style: theme.textTheme.titleLarge?.copyWith(color: AppColor.pink),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeatureTile(
                      title: "Leave Report",
                      subtitle: "View all of yours tracked report",
                      prefixIcon: Icons.analytics_outlined,
                      onTap: () {
                        Navigator.of(context).pushNamed(DemoLeaveReportPage.routeName);
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeatureTile(
                      title: "Request Leave",
                      subtitle: "Ask for leave request",
                      prefixIcon: Icons.work_history_rounded,
                      onTap: () {
                        Navigator.of(context).pushNamed(DemoLeaveRequestPage.routeName);
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeatureTile(
                      title: "View Members",
                      subtitle: "View all of your organization members.",
                      prefixIcon: Icons.groups_2_rounded,
                      onTap: () {
                        Navigator.of(context).pushNamed(DemoViewMember.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
