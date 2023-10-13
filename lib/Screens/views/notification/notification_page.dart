import 'package:flutter/material.dart';

import '../../widgets/custom/custom_app_bar.dart';
import '../../widgets/notification_tile.dart';
import '../../widgets/parent_screen.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = "/notification-page";
  const NotificationPage({super.key});

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
