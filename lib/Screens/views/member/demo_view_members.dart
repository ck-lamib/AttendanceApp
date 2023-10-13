import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/custom_app_bar.dart';
import '../../widgets/parent_screen.dart';
import '../../widgets/view_member_tile.dart';

class ViewMember extends StatelessWidget {
  static const String routeName = "/view-member-page";
  const ViewMember({super.key});

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
