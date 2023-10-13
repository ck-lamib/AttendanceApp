import 'package:attendance_bloc/utils/constants/colors.dart';
import 'package:attendance_bloc/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({
    super.key,
    this.title,
    this.time,
    this.buttonText,
    this.buttonAction,
  });
  final String? title;
  final String? time;
  final String? buttonText;
  final VoidCallback? buttonAction;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: AppColor.main,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Check in for attendance",
                style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.lightPink),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                time ?? DateTime.now().getDate(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColor.lightPink,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          buttonAction == null
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: AppColor.pink.withOpacity(0.5),
                      // backgroundColor: ,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    buttonText ?? "Check In",
                    style:
                        theme.textTheme.bodyMedium?.copyWith(color: AppColor.dark.withOpacity(0.8)),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: AppColor.pink,
                      // backgroundColor: ,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    buttonText ?? "Check In",
                    style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.dark),
                  ),
                ),
        ],
      ),
    );
  }
}
