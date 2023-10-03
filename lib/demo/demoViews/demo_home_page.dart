import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/widget/activity_tile.dart';
import 'package:attendance_bloc/common/widget/clock_detail.dart';
import 'package:attendance_bloc/common/widget/feature_tile.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class DemoHomePage extends StatelessWidget {
  static const String routeName = "/demo-home-page/";
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
        child: SafeArea(
          child: CustomScrollView(slivers: [
            // A flexible app bar
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
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
                            style:
                                theme.textTheme.headlineLarge?.copyWith(color: AppColor.lightPink),
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
                        onTap: () {},
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
                      style: theme.textTheme.titleLarge?.copyWith(color: AppColor.pink),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ActivityTile(),
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
                    FeatureTile(),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeatureTile(),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeatureTile(),
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
