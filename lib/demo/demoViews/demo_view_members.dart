import 'package:attendance_bloc/common/utils/image_path.dart';
import 'package:attendance_bloc/common/widget/custom_app_bar.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/common/widget/view_member_tile.dart';
import 'package:flutter/material.dart';

class DemoViewMember extends StatelessWidget {
  static const String routeName = "/demo-viewMember-page/";
  const DemoViewMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "View Member",
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: height * 0.1,
                    // ),
                    ViewMemberTile(
                      userName: "Bimal khatri",
                      userAvtar: Image.asset(
                        ImagePath.userAvatarImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const ViewMemberTile(userName: "Bimal khatri"),
                    const ViewMemberTile(userName: "Bimal khatri"),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
