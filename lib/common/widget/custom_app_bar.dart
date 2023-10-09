import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.hasLeading = true,
    this.automaticallyImplyLeading = false,
    this.title,
    this.flexibleSpace,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.leadingWidth = 24,
    this.titleTextStyle,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.titileSpacing,
    this.padding,
  });
  final bool hasLeading;
  final bool automaticallyImplyLeading;
  final String? title;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? centerTitle;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final double? titileSpacing;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        leading: hasLeading
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.lightPink,
                ))
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title:
            title != null ? Text(title!, style: Theme.of(context).textTheme.headlineSmall) : null,
        actions: actions,
        elevation: 0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        foregroundColor: foregroundColor,
        centerTitle: centerTitle,
        leadingWidth: leadingWidth,
        titleTextStyle: titleTextStyle,
        titleSpacing: titileSpacing,
        bottom: bottom,
        bottomOpacity: bottomOpacity,
        flexibleSpace: flexibleSpace,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
