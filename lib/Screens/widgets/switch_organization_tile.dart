import 'package:attendance_bloc/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SwitchOrganizationTile extends StatelessWidget {
  const SwitchOrganizationTile({
    super.key,
    this.organizationImage,
    this.trailingIcon,
    required this.userName,
    required this.organizationName,
  });

  final Widget? organizationImage;
  final Widget? trailingIcon;
  final String userName;
  final String organizationName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.dark,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: const Color(0xffF8DAFF).withOpacity(0.2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.dark.withOpacity(0.9),
              )),
          child: CircleAvatar(
            backgroundColor: AppColor.dark.withOpacity(0.9),
            child: organizationImage != null
                ? SizedBox.expand(
                    child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: organizationImage,
                  ))
                : const Icon(
                    Icons.apartment_rounded,
                    color: AppColor.lightPink,
                  ),
          ),
        ),

        // CircleAvatar(
        //   backgroundColor: AppColor.dark.withOpacity(0.9),
        //   child: organizationImage ??
        //       const Icon(
        //         Icons.apartment_rounded,
        //         color: AppColor.lightPink,
        //       ),
        // ),
        title: Text(
          userName,
          style: theme.textTheme.titleSmall?.copyWith(
            color: AppColor.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          organizationName,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColor.dark,
            fontWeight: FontWeight.w400,
          ),
        ),
        isThreeLine: organizationName.length > 100,
        trailing: trailingIcon ??
            const Icon(
              Icons.login,
              color: AppColor.dark,
            ),
      ),
    );
  }
}
