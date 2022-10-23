import 'package:flutter/material.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/style/colors.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';

class CustomInput extends StatelessWidget {
  final FocusNode? searchFocusNode;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffix;
  final Function()? onSubmitted;
  final Function()? onChanged;
  final Color? backgroundColor;

  const CustomInput({
    super.key,
    this.searchFocusNode,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.suffix,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.spacing3XL,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingM),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.background_100,
        borderRadius: const BorderRadius.all(
          Radius.circular(Dimens.spacingSM),
        ),
      ),
      child: TextFormField(
        focusNode: searchFocusNode,
        controller: controller,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (_) => onChanged?.call(),
        onFieldSubmitted: (_) => onSubmitted?.call(),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hintText ?? "",
          hintStyle: context.typo.body1.dark_50(),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
