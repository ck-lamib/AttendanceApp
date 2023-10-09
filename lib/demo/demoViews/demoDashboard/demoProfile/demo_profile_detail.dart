import 'dart:io';

import 'package:attendance_bloc/common/utils/validators.dart';
import 'package:attendance_bloc/common/widget/custom_outline_textfield.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/common/widget/pick_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/common_constants.dart';

class DemoProfileDetailPage extends StatefulWidget {
  static const String routeName = "/demo-detail-page/";
  const DemoProfileDetailPage({super.key});

  @override
  State<DemoProfileDetailPage> createState() => _DemoProfileDetailPageState();
}

class _DemoProfileDetailPageState extends State<DemoProfileDetailPage> {
  bool isReadOnly = true;
  toogleReadonly() {
    isReadOnly = !isReadOnly;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                    "assets/aarambahcv.jpeg",
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
                                      readOnly: isReadOnly,
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
                                      readOnly: isReadOnly,
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
                                          text: "Aarambha It Research Centerasdf lskdf las"),
                                      hint: "Your Organization",
                                      readOnly: true,
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      autofillHints: const [AutofillHints.organizationName],
                                      prefixIcon: const Icon(
                                        Icons.apartment_sharp,
                                        color: AppColor.dark,
                                      ),
                                      validator: Validators.checkEmailField,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: width * 0.5),
                                      child: CustomOutlinedTextField(
                                        controller: TextEditingController(text: "Developer"),
                                        hint: "Role",
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        autofillHints: const [AutofillHints.jobTitle],
                                        prefixIcon: const Icon(
                                          Icons.badge_rounded,
                                          color: AppColor.dark,
                                        ),
                                        validator: Validators.checkEmailField,
                                      ),
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
                              children: isReadOnly
                                  ? [
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
                                            "assets/userAvatar.jpeg",
                                          ),
                                          maxRadius: width * 0.12,
                                        ),
                                      ),
                                    ]
                                  : [
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
                                          File? file =
                                              await ImageService().pickAndCropImage(context);
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
                                              "assets/userAvatar.jpeg",
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
                                            File? file =
                                                await ImageService().pickAndCropImage(context);
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
