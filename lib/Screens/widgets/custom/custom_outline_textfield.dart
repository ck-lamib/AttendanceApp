import 'package:attendance_bloc/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final double borderRadius;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final VoidCallback? onEditing;
  // final EdgeInsets scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final int? maxLines;

  const CustomOutlinedTextField(
      {Key? key,
      this.fillColor,
      required this.hint,
      this.preIconPath,
      this.suffixIcon,
      this.onValueChange,
      this.controller,
      this.validator,
      required this.textInputAction,
      this.textInputType,
      this.border,
      this.readOnly = false,
      this.showError = true,
      this.textCapitalization = TextCapitalization.sentences,
      this.onTap,
      this.onSubmitted,
      this.autofocus = false,
      this.maxCharacters,
      this.focusNode,
      this.labelText,
      this.borderRadius = 15,
      this.prefixIcon,
      this.onEditing,
      this.hintStyle,
      // this.scrollPadding = const EdgeInsets.all(20.0),
      this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
      this.cursorHeight,
      this.obscureText = false,
      this.autofillHints,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      // scrollPadding: scrollPadding,

      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: (readOnly == null) ? false : readOnly!,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onEditingComplete: onEditing,
      // cursorColor: AppColors.backGroundColor,
      cursorColor: AppColor.main,
      cursorHeight: cursorHeight,
      autofillHints: autofillHints,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      obscureText: obscureText,
      obscuringCharacter: "-",
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: contentPadding,
        label: labelText != null
            ? Text(
                labelText ?? "",
              )
            : null,
        fillColor: fillColor ?? AppColor.lightPink,
        filled: false,
        prefixIcon: prefixIcon,
        suffixIcon: (suffixIcon != null) ? suffixIcon : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: const BorderSide(color: AppColor.dark)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: const BorderSide(color: AppColor.dark)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: const BorderSide(color: AppColor.dark)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: const BorderSide(color: Colors.redAccent)),

        errorStyle: const TextStyle(fontSize: 12, color: Colors.redAccent),
        hintText: hint,
        hintStyle: hintStyle ?? theme.textTheme.bodySmall?.copyWith(color: AppColor.dark),
        // hintStyle: CustomTextStyles.f16W400(color: AppColors.hintTextColor),
      ),
      style: theme.textTheme.bodySmall?.copyWith(color: AppColor.dark),
    );
  }
}
