import 'package:attendance_bloc/utils/helpers/image_path.dart';
import 'package:attendance_bloc/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_dropdown_textfield.dart';
import '../../widgets/custom/custom_outline_textfield.dart';
import '../../widgets/custom/snackbar.dart';
import '../../widgets/parent_screen.dart';

class LeaveRequestPage extends StatefulWidget {
  static const String routeName = "/leave-request-page";
  const LeaveRequestPage({super.key});

  @override
  State<LeaveRequestPage> createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
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
                        "Leave Request",
                        style: theme.textTheme.headlineSmall?.copyWith(color: AppColor.lightPink),
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
                                      "Request Leave",
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
                                      controller: startDate,
                                      readOnly: true,
                                      hint: "Start Date",
                                      textInputAction: TextInputAction.next,
                                      prefixIcon: const Icon(
                                        Icons.date_range_rounded,
                                        color: AppColor.dark,
                                      ),
                                      onTap: () async {
                                        showDatePicker(
                                          context: context,
                                          helpText: "Select start date",
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now().add(const Duration(days: 180)),
                                        ).then((date) {
                                          if (date != null) {
                                            startDate.text = date.toString();
                                            startDate.text = DateFormat("yyyy-MM-dd").format(date);
                                          }
                                        });
                                      },
                                      validator: Validators.checkFieldEmpty,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    CustomOutlinedTextField(
                                      controller: endDate,
                                      readOnly: true,
                                      hint: "End Date (optional)",
                                      textInputAction: TextInputAction.next,
                                      prefixIcon: const Icon(
                                        Icons.date_range_rounded,
                                        color: AppColor.dark,
                                      ),
                                      onTap: () async {
                                        if (startDate.text.isEmpty) {
                                          CustomSnackBar.show(
                                            context: context,
                                            customSnackbarType: CustomSnackbarType.info,
                                            title: "Missing Field",
                                            message: "Please select start date first",
                                          );
                                        } else {
                                          showDatePicker(
                                            context: context,
                                            helpText: "Select end date",
                                            initialDate: DateTime.parse(startDate.text)
                                                .add(const Duration(days: 1)),
                                            firstDate: DateTime.parse(startDate.text)
                                                .add(const Duration(days: 1)),
                                            lastDate: DateTime.now().add(const Duration(days: 179)),
                                          ).then((date) {
                                            if (date != null) {
                                              endDate.text = date.toString();
                                              endDate.text = DateFormat("yyyy-MM-dd").format(date);
                                            }
                                          });
                                        }
                                      },
                                      validator: Validators.checkFieldEmpty,
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    CustomDropdownTextField(
                                      dropDownItemLists: const [
                                        DropdownMenuItem(
                                          value: "Holiday",
                                          child: Text("Holiday"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Sick Leave",
                                          child: Text("Sick Leave"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Exam Leave",
                                          child: Text("Exam Leave"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Other",
                                          child: Text("Other"),
                                        ),
                                      ],
                                      itemValue: itemValue,
                                      hint: "Reason",
                                      prefixIcon: const Icon(
                                        Icons.subject_rounded,
                                        color: AppColor.dark,
                                      ),
                                      onValueChange: (value) {
                                        itemValue = value;
                                        setState(() {});
                                      },
                                      validator: Validators.checkFieldEmpty,
                                    ),
                                    itemValue == "Other"
                                        ? SizedBox(
                                            height: height * 0.03,
                                          )
                                        : const SizedBox.shrink(),
                                    itemValue == "Other"
                                        ? const CustomOutlinedTextField(
                                            hint: "Other Reason",
                                            textInputAction: TextInputAction.next,
                                            prefixIcon: Icon(
                                              Icons.subject_rounded,
                                              color: AppColor.dark,
                                            ),
                                            validator: Validators.checkFieldEmpty,
                                          )
                                        : const SizedBox.shrink(),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    const CustomOutlinedTextField(
                                      hint: "Description",
                                      maxLines: 5,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      validator: Validators.checkFieldEmpty,
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
                                      ImagePath.userAvatarImagePath,
                                    ),
                                    maxRadius: width * 0.12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "You will get notification once the request is approved by your organization Admin.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColor.lightPink),
                      ),
                      SizedBox(
                        height: height * 0.05,
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
