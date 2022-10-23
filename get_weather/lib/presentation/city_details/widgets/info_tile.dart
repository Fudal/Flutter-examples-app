import 'package:flutter/material.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String? value;

  const InfoTile({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.typo.body2,
        ),
        const SizedBox(width: Dimens.spacingXs),
        Text(
          value ?? "",
          style: context.typo.body1.dark_50(),
        )
      ],
    );
  }
}
