import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/device_item.dart';
import 'package:fh_home_coding/extensions/context_extension.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/presentation/home/widgets/copy_widget.dart';
import 'package:fh_home_coding/presentation/home/widgets/device/widgets/device_buttons_tile.dart';
import 'package:fh_home_coding/presentation/home/widgets/device/widgets/device_top_section.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:fh_home_coding/widgets/expanded_container.dart';
import 'package:flutter/material.dart';

class DeviceTile extends StatelessWidget {
  final DeviceItem device;

  const DeviceTile({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      titleWidget: DeviceTopSection(device: device),
      childrenWidgets: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(LocaleKeys.common_device_address.tr(), style: context.typo.bodySmall),
            ),
            const Spacer(),
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Text(device.address, style: context.typo.bodyMedium)),
                  const SizedBox(width: Dimens.spacingXs),
                  const CopyWidget()
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(LocaleKeys.common_device_device_id.tr(), style: context.typo.bodySmall),
            ),
            const Spacer(),
            Flexible(child: Text("${device.id}", style: context.typo.bodyMedium)),
            const Spacer(),
          ],
        ),
        const SizedBox(height: Dimens.spacingS),
        DeviceButtonsTile(device: device),
      ],
    );
  }
}
