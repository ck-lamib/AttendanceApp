import 'package:attendance_bloc/Screens/auth/views/change_password.dart';
import 'package:attendance_bloc/Screens/auth/views/login_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/report_bug.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/user_detail_page.dart';
import 'package:attendance_bloc/Screens/dashboard/profile/views/view_organization_page.dart';
import 'package:attendance_bloc/Screens/organization/views/organization_setup.dart';
import 'package:attendance_bloc/Screens/organization/views/switch_organization.dart';
import 'package:attendance_bloc/core/core_controller.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../widgets/parent_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ParentScreen(
        child: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              // A flexible app bar
              SliverAppBar(
                expandedHeight: height * 0.05,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Setting Page",
                  style: theme.textTheme.headlineSmall?.copyWith(color: AppColor.pink),
                ),
                pinned: true,
              ),

              SliverFillRemaining(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // CircleAvatar(
                            //   foregroundColor: AppColor.pink,
                            //   backgroundColor: AppColor.main,
                            //   maxRadius: width * 0.15,
                            //   minRadius: width * 0.1,
                            //   child: Icon(
                            //     Icons.person,
                            //     size: width * 0.15,
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.main, width: 4),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                foregroundColor: AppColor.pink,
                                backgroundColor: AppColor.main,
                                backgroundImage: const AssetImage(
                                  ImagePath.userAvatarImagePath,
                                ),
                                maxRadius: width * 0.15,
                                minRadius: width * 0.1,
                              ),
                            ),
                            Positioned(
                              top: width * 0.04,
                              right: width * 0.015,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.main, width: 4),
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  foregroundColor: AppColor.pink,
                                  backgroundColor: AppColor.pink,
                                  maxRadius: width * 0.015,
                                  minRadius: width * 0.01,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -width * 0.013,
                              child: Chip(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: Colors.transparent)),
                                avatar: const Icon(
                                  Icons.verified_rounded,
                                  color: AppColor.dark,
                                ),
                                backgroundColor: AppColor.pink,
                                label: Text(
                                  "Verified",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppColor.main,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          "Bimal Khatri",
                          style: theme.textTheme.titleSmall?.copyWith(color: AppColor.lightPink),
                        ),
                        Text(
                          "bimal@aarambhait.com",
                          style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.lightPink),
                        ),
                        SizedBox(
                          height: height * 0.07,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xffFBE9FF),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  color: const Color(0xffF8DAFF).withOpacity(0.5),
                                )
                              ]),
                          child: Column(
                            // shrinkWrap: true,
                            children: [
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.person,
                                  color: AppColor.dark,
                                ),
                                title: "User Profile",
                                onTap: () {
                                  Navigator.of(context).pushNamed(ProfileDetailPage.routeName);
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.password_rounded,
                                  color: AppColor.dark,
                                ),
                                title: "Change Password",
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ChangePasswordPage.routeName,
                                  );
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.bug_report_rounded,
                                  color: AppColor.dark,
                                ),
                                title: "Report a Bug",
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ReportBugPage.routeName,
                                  );
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.apartment_sharp,
                                  color: AppColor.dark,
                                ),
                                title: "View Your Organization",
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ViewOrganizationDetailPage.routeName,
                                  );
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.add_home_work_outlined,
                                  color: AppColor.dark,
                                ),
                                title: "Setup your organization",
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    OrganizationSetupPage.routeName,
                                  );
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.switch_account_rounded,
                                  color: AppColor.dark,
                                ),
                                title: "Switch organization",
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    SwitchOrganizationPage.routeName,
                                  );
                                },
                              ),
                              ProfileTile(
                                leadingIcon: const Icon(
                                  Icons.logout_rounded,
                                  color: AppColor.dark,
                                ),
                                title: "Log Out",
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Logout"),
                                        content: const Text(
                                          "Are you sure?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("No"),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              CoreController cc = locator.get<CoreController>();
                                              await cc.loggedOut();
                                              if (context.mounted) {
                                                Navigator.of(context).pushNamedAndRemoveUntil(
                                                  LoginPage.routeName,
                                                  (route) => false,
                                                );
                                              }
                                            },
                                            child: const Text("Yes"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });
  final Widget leadingIcon;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: leadingIcon,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleSmall?.copyWith(
          color: AppColor.dark,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColor.dark,
      ),
    );
  }
}
