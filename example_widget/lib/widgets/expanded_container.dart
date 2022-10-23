import 'package:fh_home_coding/style/colors.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:flutter/material.dart';

class ExpandedContainer extends StatelessWidget {
  final Widget titleWidget;
  final List<Widget> childrenWidgets;

  const ExpandedContainer({super.key, required this.titleWidget, required this.childrenWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary_100),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(Dimens.spacingS),
      margin: const EdgeInsets.all(Dimens.spacingXs),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.dark_80,
          collapsedIconColor: AppColors.dark_80,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          initiallyExpanded: true,
          title: titleWidget,
          children: childrenWidgets,
        ),
      ),
    );
  }
}
