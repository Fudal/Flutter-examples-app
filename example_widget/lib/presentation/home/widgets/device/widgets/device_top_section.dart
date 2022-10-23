import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/device_item.dart';
import 'package:fh_home_coding/extensions/context_extension.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/presentation/home/widgets/device/widgets/device_label.dart';
import 'package:fh_home_coding/style/app_images.dart';
import 'package:fh_home_coding/style/typography.dart';
import 'package:flutter/material.dart';

class DeviceTopSection extends StatelessWidget {
  final DeviceItem device;

  const DeviceTopSection({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        DeviceLabel(
          label: device.name,
          iconPath: AppImages.smoke,
          style: context.typo.bodyMedium,
        ),
        if (!device.isOnline)
          DeviceLabel(
            label: LocaleKeys.common_device_offline.tr(),
            iconPath: AppImages.warning,
            style: context.typo.bodyLarge.warning_100(),
          ),
        if (device.isOnline)
          DeviceLabel(
            label: LocaleKeys.common_device_online.tr(),
            iconPath: AppImages.success,
            style: context.typo.bodyMedium,
          ),
        if (device.isModified)
          DeviceLabel(
            label: LocaleKeys.common_device_tampered.tr(),
            iconPath: AppImages.warning,
            style: context.typo.bodyLarge.warning_100(),
          ),
        if (device.isSecured)
          DeviceLabel(
            label: LocaleKeys.common_device_secured.tr(),
            iconPath: AppImages.success,
            style: context.typo.bodyMedium,
          ),
        DeviceLabel(
          label: LocaleKeys.common_device_configured.tr(),
          iconPath: AppImages.success,
          style: context.typo.bodyMedium,
        ),
      ],
    );
  }
}
