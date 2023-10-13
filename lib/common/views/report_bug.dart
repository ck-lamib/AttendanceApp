import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/utils/validators.dart';
import 'package:attendance_bloc/common/widget/custom_app_bar.dart';
import 'package:attendance_bloc/common/widget/custom_outline_textfield.dart';
import 'package:attendance_bloc/common/widget/parent_screen.dart';
import 'package:attendance_bloc/common/widget/pick_image.dart';
import 'package:flutter/material.dart';

class ReportBug extends StatefulWidget {
  static const String routeName = "/report-bug/";
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Report Bug",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
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
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomOutlinedTextField(
                            maxLines: 15,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            hint: "Bug description",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            validator: Validators.checkFieldEmpty,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomOutlinedTextField(
                            hint: "Submit image( optional )",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            readOnly: true,
                            onTap: () {
                              ImageService().pickImage(
                                context,
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: AppColor.dark,
                                // backgroundColor: ,
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            child: Text(
                              "Submit Report",
                              style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.pink),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
