import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/widget/member_detail_page.dart';
import 'package:flutter/material.dart';

class ViewMemberTile extends StatelessWidget {
  const ViewMemberTile({
    super.key,
    this.userAvtar,
    required this.userName,
  });

  final Widget? userAvtar;
  final String userName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MemberDetailPage.routeName);
      },
      child: Container(
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
          leading: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.dark.withOpacity(0.9),
                )),
            child: CircleAvatar(
              backgroundColor: AppColor.dark.withOpacity(0.9),
              child: userAvtar != null
                  ? SizedBox.expand(
                      child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: userAvtar,
                    ))
                  : const Icon(
                      Icons.person_4_rounded,
                      color: AppColor.lightPink,
                    ),
            ),
          ),
          title: Text(
            userName,
            style: theme.textTheme.titleSmall?.copyWith(color: AppColor.dark),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.dark,
          ),
          isThreeLine: false,
        ),
      ),
    );
  }
}
