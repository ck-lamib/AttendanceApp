import 'package:attendance_bloc/utils/helpers/validators.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../widgets/custom/custom_app_bar.dart';
import '../../../widgets/custom/custom_outline_textfield.dart';
import '../../../widgets/parent_screen.dart';
import '../../../widgets/pick_image.dart';

class ReportBugPage extends StatefulWidget {
  static const String routeName = "/report-bug/";
  const ReportBugPage({super.key});

  @override
  State<ReportBugPage> createState() => _ReportBugPageState();
}

class _ReportBugPageState extends State<ReportBugPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
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
                          const CustomOutlinedTextField(
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
