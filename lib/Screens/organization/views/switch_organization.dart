import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/switch_organization_tile.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/parent_screen.dart';

class SwitchOrganizationPage extends StatefulWidget {
  static const String routeName = "/switch-organization-page";
  const SwitchOrganizationPage({super.key});

  @override
  State<SwitchOrganizationPage> createState() => _SwitchOrganizationPageState();
}

class _SwitchOrganizationPageState extends State<SwitchOrganizationPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Switch Organization",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        "Tap on organization tile to switch your organization",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    // SizedBox(
                    //   height: height * 0.1,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: width * 0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 2,
                              color: const Color(0xffF8DAFF).withOpacity(0.5),
                            )
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SwitchOrganizationTile(
                            organizationImage: Image.asset(
                              ImagePath.bannerImagePath,
                              fit: BoxFit.cover,
                            ),
                            userName: "Bimal khatri",
                            organizationName: "Aarambha It pvt research center",
                            trailingIcon: const Icon(
                              Icons.verified_rounded,
                              color: AppColor.dark,
                            ),
                          ),
                          const SwitchOrganizationTile(
                            userName: "ck-lamib",
                            organizationName: "Aarambha It pvt research center",
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
