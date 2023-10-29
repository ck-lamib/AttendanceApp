import 'package:attendance_bloc/Screens/notification/bloc/notification_bloc.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/notification_tile.dart';
import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = "/notification-page";
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void didChangeDependencies() {
    context.read<NotificationBloc>().add(GetNotificationEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Notification",
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: BlocBuilder<NotificationBloc, NotificationState>(builder: (_, state) {
                        switch (state.status) {
                          case NotificationStatus.loading:
                            return const Text("hello loading");
                          case NotificationStatus.success:
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: state.notificationList
                                    .map((notification) => NotificationTile(
                                          title: notification.title!,
                                          subTitle: notification.description!,
                                        ))
                                    .toList()

                                //  [
                                //   // SizedBox(
                                //   //   height: height * 0.1,
                                //   // ),
                                //   NotificationTile(
                                //     title: "Notification title",
                                //     subTitle: "Notification subtitle",
                                //   ),
                                //   NotificationTile(
                                //     title: "Notification title",
                                //     subTitle: "Notification subtitle",
                                //   ),
                                // ],
                                );
                          case NotificationStatus.error:
                            return const Text("Error");
                          default:
                            return const SizedBox();
                        }
                      }),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
