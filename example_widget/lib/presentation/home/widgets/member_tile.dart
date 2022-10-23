import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/person_item.dart';
import 'package:fh_home_coding/extensions/context_extension.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/presentation/home/widgets/copy_widget.dart';
import 'package:fh_home_coding/style/app_images.dart';
import 'package:fh_home_coding/style/colors.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:fh_home_coding/widgets/buttons/rounded_button.dart';
import 'package:fh_home_coding/widgets/expanded_container.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final PersonItem person;

  const MemberTile({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      titleWidget: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.member),
              const SizedBox(width: Dimens.spacingXs),
              Flexible(
                child: Text(
                  person.name,
                  style: context.typo.bodyMedium,
                ),
              ),
              const SizedBox(width: Dimens.spacingXs),
              const CopyWidget(),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.phone),
              const SizedBox(width: Dimens.spacingXs),
              Flexible(
                child: Text(
                  person.phone,
                  style: context.typo.bodyMedium,
                ),
              ),
              const SizedBox(width: Dimens.spacingXs),
              const CopyWidget(),
            ],
          ),
          Text(
            "${LocaleKeys.common_device_priority.tr()} ${person.priority}",
            style: context.typo.bodyMedium,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.alternate_email_outlined,
                size: 15,
                color: AppColors.dark_80,
              ),
              const SizedBox(width: Dimens.spacingXs),
              Flexible(child: Text(person.email, style: context.typo.bodyMedium)),
              const SizedBox(width: Dimens.spacingXs),
              const CopyWidget(),
            ],
          ),
        ],
      ),
      childrenWidgets: [
        Row(
          children: [
            Flexible(
              child: Text(
                LocaleKeys.common_device_updated_at.tr(),
                style: context.typo.bodySmall,
              ),
            ),
            const Spacer(),
            Flexible(
              child: Text(
                "${person.updatedAt.day < 10 ? "0" : ""}${person.updatedAt.day}."
                "${person.updatedAt.month < 10 ? "0" : ""}"
                "${person.updatedAt.month}."
                "${person.updatedAt.year}",
                style: context.typo.bodyMedium,
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
        const SizedBox(height: Dimens.spacingS),
        Row(
          children: [
            RoundedButton(text: LocaleKeys.common_device_edit.tr()),
            const SizedBox(width: Dimens.spacingS),
            RoundedButton(text: LocaleKeys.common_device_delete.tr()),
          ],
        ),
      ],
    );
  }
}
