import 'package:attendance_bloc/common/widget/custom_app_bar.dart';
import 'package:attendance_bloc/common/widget/notification_tile.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:flutter/material.dart';

class DemoNotificationPage extends StatelessWidget {
  static const String routeName = "/demo-notification-page/";
  const DemoNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          appBar: CustomAppBar(
            title: "Notification",
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: height * 0.1,
                          // ),
                          NotificationTile(
                            title: "Notification title",
                            subTitle: "Notification subtitle",
                          ),
                          NotificationTile(
                            title: "Notification title",
                            subTitle: "Notification subtitle",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
