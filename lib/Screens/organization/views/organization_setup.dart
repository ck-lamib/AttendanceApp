import 'dart:io';

import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_elevated_button.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_outline_textfield.dart';
import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:attendance_bloc/Screens/widgets/pick_image.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants/colors.dart';

class OrganizationSetupPage extends StatefulWidget {
  static const String routeName = "/organization-setup-page";
  const OrganizationSetupPage({super.key});

  @override
  State<OrganizationSetupPage> createState() => _OrganizationSetupPageState();
}

class _OrganizationSetupPageState extends State<OrganizationSetupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _organizationNameController = TextEditingController();
  final TextEditingController _organizationDescController = TextEditingController();
  final TextEditingController _organizationAddressController = TextEditingController();
  final TextEditingController _organizationContactController = TextEditingController();
  final TextEditingController _organizationWebsiteLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Set Organization",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OrganizationFormTile(
                        title: "About Organization",
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomOutlinedTextField(
                              controller: _organizationNameController,
                              hint: "Organization Name",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              validator: Validators.checkFieldEmpty,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            CustomOutlinedTextField(
                              controller: _organizationDescController,
                              maxLines: 7,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              hint: "Organization description",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ],
                        ),
                      ),
                      OrganizationFormTile(
                        title: "Contact",
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomOutlinedTextField(
                              controller: _organizationAddressController,
                              hint: "Address",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              validator: Validators.checkFieldEmpty,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            CustomOutlinedTextField(
                              controller: _organizationContactController,
                              hint: "Contact Number",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.phone,
                              validator: Validators.checkFieldEmpty,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            CustomOutlinedTextField(
                              controller: _organizationWebsiteLinkController,
                              hint: "Website Link",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.url,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ],
                        ),
                      ),
                      OrganizationFormTile(
                        title: "Organization Logo",
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                File? image = await ImageService().pickImage(
                                  context,
                                  source: ImageSource.gallery,
                                );
                                CustomLogger.trace(image?.path);
                              },
                              child: DottedBorder(
                                radius: const Radius.circular(10),
                                borderType: BorderType.RRect,
                                dashPattern: const [6, 4],
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  height: width * 0.5,
                                  child: const Center(
                                    child: Wrap(
                                      children: [
                                        Text(
                                          "Upload Logo   ",
                                          style: TextStyle(
                                            color: AppColor.dark,
                                          ),
                                        ),
                                        Icon(
                                          Icons.cloud_upload_rounded,
                                          color: AppColor.dark,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // SizedBox(
                            //   height: height * 0.03,
                            // ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     if (_formKey.currentState!.validate()) {}
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //       elevation: 5,
                            //       backgroundColor: AppColor.dark,
                            //       // backgroundColor: ,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(8))),
                            //   child: Text(
                            //     "Submit Report",
                            //     style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.pink),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CustomElevatedButton(
                        backGroundColor: AppColor.dark,
                        textColor: AppColor.lightPink,
                        title: "Create Organization",
                        size: Size(width * 0.5, 50),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // context.read<LoginBloc>().add(
                            //       SubmitCredentialEvent(
                            //           userName: _emailController.text,
                            //           password: _passwordController.text),
                            //     );
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil(DashboardPage.routeName, (route) => false);
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class OrganizationFormTile extends StatelessWidget {
  const OrganizationFormTile({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
//  var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.only(
        top: width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          Container(
            margin: EdgeInsets.only(top: width * 0.05, left: width * 0.05, right: width * 0.05),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 2,
                    color: const Color(0xffF8DAFF).withOpacity(0.3),
                  )
                ]),
            child: child,
          ),
        ],
      ),
    );
  }
}
