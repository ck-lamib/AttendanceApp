import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    super.key,
    this.title,
    this.subtitle,
    this.prefixIcon,
    this.onTap,
  });
  final String? title;
  final String? subtitle;
  final IconData? prefixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xffFBE9FF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: const Color(0xffF8DAFF).withOpacity(0.42),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap ?? () {},
        leading: CircleAvatar(
            // foregroundColor: AppColors.secondaryColor,
            backgroundColor: Colors.transparent,
            child: Icon(
              prefixIcon ?? Icons.desktop_windows_rounded,
              color: AppColor.dark,
            )),
        title: Text(
          title ?? "Leave Report",
          style: theme.textTheme.titleMedium?.copyWith(color: AppColor.dark),
        ),
        subtitle: Text(
          subtitle ?? "View all of yours tracked report",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.dark),
        ),
        isThreeLine: false,
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: AppColor.dark,
        ),
      ),
    );
  }
}
