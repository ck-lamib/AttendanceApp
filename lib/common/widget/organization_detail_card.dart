import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class OrganizationDetailCard extends StatelessWidget {
  const OrganizationDetailCard({
    super.key,
    required this.title,
    required this.widget,
    required this.expansionTileController,
    required this.onExpansionChanged,
  });

  final String title;
  final Widget widget;
  final ExpansionTileController expansionTileController;
  final Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFBE9FF).withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: const Color(0xffF8DAFF).withOpacity(0.2),
          ),
        ],
      ),
      child: ExpansionTile(
        key: Key(key.toString()),
        controller: expansionTileController,
        onExpansionChanged: onExpansionChanged,
        iconColor: AppColor.dark,
        collapsedIconColor: AppColor.dark,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            color: AppColor.dark,
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16, 0),
            child: Divider(
              color: AppColor.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
            child: widget,
          ),
        ],
      ),
    );
  }
}
