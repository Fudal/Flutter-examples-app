import 'package:fh_home_coding/style/dimens.dart';
import 'package:flutter/material.dart';

class DeviceLabel extends StatelessWidget {
  final String? iconPath;
  final String label;
  final TextStyle style;

  const DeviceLabel({super.key, this.iconPath, required this.label, required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconPath != null) ...[
          Image.asset(iconPath!),
          const SizedBox(width: Dimens.spacingXs),
        ],
        Text(
          label,
          style: style,
        ),
      ],
    );
  }
}
