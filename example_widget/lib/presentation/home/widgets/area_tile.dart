import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/area_item.dart';
import 'package:fh_home_coding/extensions/context_extension.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:fh_home_coding/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class AreaTile extends StatelessWidget {
  final AreaItem area;

  const AreaTile({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(area.iconPath),
              const SizedBox(width: Dimens.spacingS),
              Text(
                area.name,
                style: context.typo.bodyLarge,
              ),
            ],
          ),
        ),
        Flexible(
          child: Wrap(
            children: [
              RoundedButton(text: LocaleKeys.area_contact.tr(), prefixIcon: Icons.add),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(text: LocaleKeys.area_room.tr(), prefixIcon: Icons.add),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(text: LocaleKeys.area_device.tr(), prefixIcon: Icons.add),
              const SizedBox(width: Dimens.spacingS),
              RoundedButton(
                text: "${area.notesCount} ${LocaleKeys.area_notes.tr()}",
                suffixIcon: Icons.chevron_right,
              ),
            ],
          ),
        )
      ],
    );
  }
}
