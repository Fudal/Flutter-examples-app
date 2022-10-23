import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/device_item.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/style/colors.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:fh_home_coding/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class DeviceButtonsTile extends StatelessWidget {
  final DeviceItem device;

  const DeviceButtonsTile({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Wrap(
            children: [
              RoundedButton(text: LocaleKeys.common_device_edit.tr()),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(text: LocaleKeys.common_device_unpair.tr()),
              const SizedBox(width: Dimens.spacingS),
              if (device.allowDelete) ...[
                RoundedButton(text: LocaleKeys.common_device_delete.tr()),
                const SizedBox(width: Dimens.spacingS),
              ],
              RoundedButton(text: LocaleKeys.common_device_identify.tr()),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(text: LocaleKeys.common_device_ping.tr()),
              const SizedBox(width: Dimens.spacingS),
              if (device.allowSensitivity) ...[
                RoundedButton(text: LocaleKeys.common_device_sensitivity.tr()),
                const SizedBox(width: Dimens.spacingS),
              ],
              if (device.allowTestSiren)
                RoundedButton(
                  text: LocaleKeys.common_device_test_siren.tr(),
                  backgroundColor: AppColors.white,
                  contentColor: AppColors.dark_80,
                  side: const BorderSide(color: AppColors.dark_80),
                ),
            ],
          ),
        ),
        Flexible(
          child: Wrap(
            children: [
              RoundedButton(
                text: LocaleKeys.common_device_timeline.tr(),
                suffixIcon: Icons.chevron_right,
              ),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(
                text: "${device.notesCount} ${LocaleKeys.common_device_notes.tr()}",
                suffixIcon: Icons.chevron_right,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
