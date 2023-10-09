import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
  });

  final Widget? icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFBE9FF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: const Color(0xffF8DAFF).withOpacity(0.2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.dark.withOpacity(0.9),
          child: icon ??
              const Icon(
                Icons.campaign_rounded,
                color: AppColor.lightPink,
              ),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(color: AppColor.dark),
        ),
        subtitle: Text(
          subTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall?.copyWith(color: AppColor.dark),
        ),
        isThreeLine: subTitle.length > 50,
      ),
    );
  }
}
