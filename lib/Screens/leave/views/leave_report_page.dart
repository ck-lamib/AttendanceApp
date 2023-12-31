import 'package:attendance_bloc/Screens/widgets/parent_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/custom/custom_app_bar.dart';

class LeaveReportPage extends StatefulWidget {
  static const String routeName = "/leave-report-page";
  const LeaveReportPage({super.key});

  @override
  State<LeaveReportPage> createState() => _LeaveReportPageState();
}

class _LeaveReportPageState extends State<LeaveReportPage> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  String? selectedFilter = "Month";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "Leave Report",
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Leave Report By: ',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: AppColor.lightPink,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: selectedFilter,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: AppColor.lightPink,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              // alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.main,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Filter  :     ",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                      ),
                                      value: selectedFilter,
                                      items: [
                                        DropdownMenuItem(
                                          value: "Year",
                                          child: Text(
                                            "Year",
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Month",
                                          child: Text(
                                            "Month",
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Week",
                                          child: Text(
                                            "Week",
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedFilter = value;
                                        });
                                        // print(selectedFilter);
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  // Text(
                                  //   "Months",
                                  //   textAlign: TextAlign.center,
                                  //   style: Theme.of(context).textTheme.bodyMedium,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          const PieChartWidget(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
//  var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    List<LeaveType> values = [
      LeaveType(name: "Work Days", value: 75, color: AppColor.pink),
      LeaveType(name: "Holidays", value: 5, color: AppColor.main),
      LeaveType(name: "Leave Days", value: 20, color: AppColor.lightPink),
    ];
    List<PieChartSectionData> pieChartSectionDatas = values
        .map((value) => PieChartSectionData(
              showTitle: false,
              color: value.color,
              value: value.value,
              title: '${value.value}%',
              radius: width * 0.3,
              titleStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColor.dark),
            ))
        .toList();

    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: pieChartSectionDatas,
              ),
            ),
          ),
          Row(
            children: [
              const Expanded(child: Text("")),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: values
                    .map((value) => Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Indicator(
                            color: value.color,
                            text: value.name,
                          ),
                        ))
                    .toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LeaveType {
  LeaveType({required this.name, required this.value, required this.color});
  String? name;
  double? value;
  Color? color;
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.size = 16,
    this.textColor,
  });
  final Color? color;
  final String? text;

  final double? size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.sizeOf(context).width * 0.07,
          height: MediaQuery.sizeOf(context).width * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.03,
        ),
        Text(
          text ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
