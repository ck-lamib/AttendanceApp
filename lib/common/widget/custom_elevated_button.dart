import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Size? size;
  final bool isDisabled;
  final bool isLoading;
  final Color? backGroundColor;
  final Color? textColor;
  final double? elevation;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.size,
    this.isDisabled = false,
    this.isLoading = false,
    this.backGroundColor = AppColor.pink,
    this.textColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backGroundColor,
          minimumSize: size ?? const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: isDisabled ? null : onTap,
      child: isLoading
          ? const CircularProgressIndicator(
              color: AppColor.dark,
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.dark),
            ),
    );
  }
}
