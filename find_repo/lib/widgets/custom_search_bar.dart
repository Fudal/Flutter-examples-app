import 'package:find_repo/extenstions/context_extension.dart';
import 'package:find_repo/style/colors.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:find_repo/style/typography.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final FocusNode? searchFocusNode;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffix;
  final Function()? onSubmitted;
  final Function()? onChanged;
  final Color? backgroundColor;

  const CustomSearchBar({
    super.key,
    this.searchFocusNode,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
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
          hintText: hintText ?? "",
          hintStyle: context.typo.body1.dark_50(),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
