import 'dart:io';

import 'package:attendance_bloc/Screens/widgets/custom/custom_dropdown_textfield.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_outline_textfield.dart';
import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:attendance_bloc/Screens/widgets/pick_image.dart';
import 'package:attendance_bloc/utils/constants/colors.dart';
import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';

class MemberDetailPage extends StatefulWidget {
  static const String routeName = "/member-detail-page/";
  const MemberDetailPage({super.key});

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  String? itemValue;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ParentScreen(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 10,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.main,
                ),
              ),
              flexibleSpace: Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        // blurStyle: BlurStyle.inner,
                        blurRadius: 5,
                        spreadRadius: 4,
                        color: const Color(0xff5A2B66).withOpacity(0.9),
                      ),
                      BoxShadow(
                        blurStyle: BlurStyle.solid,
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: const Color(0xff000000).withOpacity(0.25),
                      )
                    ],
                  ),
                  child: Image.asset(
                    ImagePath.bannerImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              pinned: false,
              collapsedHeight: height * 0.2,
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
                      Text(
                        "Profile Detail",
                        style: theme.textTheme.headlineSmall?.copyWith(color: AppColor.pink),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
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
                              // shrinkWrap: true,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // CustomSnackbar();
                                      // if(isReadOnly){

                                      // }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        backgroundColor: AppColor.dark,
                                        // backgroundColor: ,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8))),
                                    child: Text(
                                      "Edit Profile",
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(color: AppColor.pink),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    CustomOutlinedTextField(
                                      controller: TextEditingController(text: "Bimal Khatri"),
                                      hint: "Full Name",
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      autofillHints: const [AutofillHints.name],
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: AppColor.dark,
                                      ),
                                      validator: Validators.checkFieldEmpty,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    CustomOutlinedTextField(
                                      controller:
                                          TextEditingController(text: "bimal@aarambhait.com"),
                                      hint: "Email",
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      autofillHints: const [AutofillHints.email],
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: AppColor.dark,
                                      ),
                                      validator: Validators.checkEmailField,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    CustomOutlinedTextField(
                                      controller: TextEditingController(
                                          text: "Aarambha It Research Center"),
                                      hint: "Your Organization",
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      autofillHints: const [AutofillHints.organizationName],
                                      prefixIcon: const Icon(
                                        Icons.apartment_sharp,
                                        color: AppColor.dark,
                                      ),
                                      validator: Validators.checkFieldEmpty,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: width * 0.6),
                                        child: CustomDropdownTextField(
                                          dropDownItemLists: const [
                                            DropdownMenuItem(
                                              value: "Admin",
                                              child: Text("Admin"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Raper",
                                              child: Text("Raper"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Developer",
                                              child: Text("Developer"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Graphic Designer",
                                              child: Text("Graphic Designer"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Analysist",
                                              child: Text("Analysist"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Other",
                                              child: Text("Other"),
                                            ),
                                          ],
                                          itemValue: itemValue,
                                          hint: "Role",
                                          prefixIcon: const Icon(
                                            Icons.badge_rounded,
                                            color: AppColor.dark,
                                          ),
                                          onValueChange: (value) {
                                            itemValue = value;
                                            setState(() {});
                                          },
                                          validator: Validators.checkFieldEmpty,
                                        )

                                        // CustomOutlinedTextField(
                                        //   controller: TextEditingController(text: "Developer"),
                                        //   hint: "Role",
                                        //   textInputType: TextInputType.text,
                                        //   textInputAction: TextInputAction.next,
                                        //   autofillHints: const [AutofillHints.jobTitle],
                                        //   prefixIcon: const Icon(
                                        //     Icons.badge_rounded,
                                        //     color: AppColor.dark,
                                        //   ),
                                        //   validator: Validators.checkEmailField,
                                        // ),
                                        ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: width * 0.05,
                            child: Stack(
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

                                GestureDetector(
                                  onTap: () async {
                                    File? file = await ImageService().pickAndCropImage(context);
                                    print(file);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.dark,
                                        width: 3,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      foregroundColor: AppColor.pink,
                                      backgroundColor: AppColor.main,
                                      backgroundImage: const AssetImage(
                                        ImagePath.userAvatarImagePath,
                                      ),
                                      maxRadius: width * 0.12,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: width * 0.02,
                                  right: width * 0.015,
                                  child: GestureDetector(
                                    onTap: () async {
                                      File? file = await ImageService().pickAndCropImage(context);
                                      print(file);
                                    },
                                    child: Container(
                                      // padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.dark,
                                          width: 3,
                                        ),
                                        shape: BoxShape.circle,
                                        color: AppColor.main,
                                      ),
                                      child: Icon(
                                        Icons.camera,
                                        size: width * 0.04,
                                        color: AppColor.pink,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
