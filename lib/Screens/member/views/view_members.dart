import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:attendance_bloc/Screens/widgets/view_member_tile.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:flutter/material.dart';

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
