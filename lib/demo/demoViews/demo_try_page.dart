import 'package:attendance_bloc/common/widget/custom_app_bar.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/common/widget/pick_image.dart';
import 'package:attendance_bloc/demo/demoViews/demoDashboard/demo_dashbord_page.dart';
import 'package:flutter/material.dart';

class DemoTryPage extends StatefulWidget {
  static const String routeName = "/demo-try-page/";
  const DemoTryPage({super.key});

  @override
  State<DemoTryPage> createState() => _DemoTryPageState();
}

class _DemoTryPageState extends State<DemoTryPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
              // title: "Try As",
              ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.15,
                    ),
                    Text(
                      "Try Demo as?",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Try demo as either Admin or User to know their feature",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: width * 0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      // decoration: BoxDecoration(
                      //     color: const Color(0xffFFFFFF),
                      //     borderRadius: BorderRadius.circular(15),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         blurRadius: 6,
                      //         spreadRadius: 2,
                      //         color: const Color(0xffF8DAFF).withOpacity(0.5),
                      //       ),
                      //     ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShortCutTile(
                            icon: const Icon(Icons.admin_panel_settings_rounded),
                            iconName: "Try as Admin",
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  DemoDashboardPage.routeName, (route) => false);
                            },
                          ),
                          ShortCutTile(
                            icon: const Icon(Icons.person_3_rounded),
                            iconName: "Try as User",
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  DemoDashboardPage.routeName, (route) => false);
                            },
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
