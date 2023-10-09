import 'package:attendance_bloc/common/widget/notification_tile.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:flutter/material.dart';

class DemoViewMember extends StatelessWidget {
  static const String routeName = "/demo-viewMember-page/";
  const DemoViewMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AppBar(
                scrolledUnderElevation: 0,
                title: Text(
                  "View Member",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            const Expanded(
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
