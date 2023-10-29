import 'package:attendance_bloc/Screens/dashboard/dashbord_page.dart';
import 'package:attendance_bloc/Screens/organization/views/admin_setup.dart';
import 'package:attendance_bloc/Screens/organization/views/organization_setup.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_app_bar.dart';
import 'package:attendance_bloc/Screens/widgets/custom/custom_outline_textfield.dart';
import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/parent_screen.dart';

class AddStaffPage extends StatefulWidget {
  static const String routeName = "/add-staff-page";
  const AddStaffPage({super.key});

  @override
  State<AddStaffPage> createState() => _AddStaffPageState();
}

class _AddStaffPageState extends State<AddStaffPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // @override
  // void didChangeDependencies() {
  //   adminDetail = ModalRoute.of(context)!.settings.arguments as AdminDetail;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "",
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
                        "Invite user to your organization using their email",
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            CustomOutlinedTextField(
                              controller: _emailController,
                              hint: "Email",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColor.dark,
                              ),
                              autofillHints: const [AutofillHints.email],
                              validator: Validators.checkEmailField,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pop();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: AppColor.dark,
                                  // backgroundColor: ,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                "Invite User",
                                style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.pink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  tooglePassword() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }

  toggleConfirmPassword() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    setState(() {});
  }
}
