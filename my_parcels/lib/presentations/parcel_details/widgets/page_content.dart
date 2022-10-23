import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/generated/locale_keys.g.dart';
import 'package:my_parcels/style/dimens.dart';
import 'package:my_parcels/style/typography.dart';

class ParcelDetailsPageContent extends StatelessWidget {
  final ParcelItem parcel;
  const ParcelDetailsPageContent(this.parcel, {super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatterDate = DateFormat(
      "yyyy-MM-dd hh:mm:ss",
      Localizations.localeOf(context).languageCode,
    );

    return Column(
      children: [
        Text(
          LocaleKeys.parcel_details_parcel_no.tr(),
          style: AppTypography.of(context).headline2.dark_100(),
        ),
        const SizedBox(height: Dimens.spacingS),
        Text(
          parcel.details?.packageNo ?? "",
          style: AppTypography.of(context).body1.dark_100(),
        ),
        const Divider(),
        Text(
          LocaleKeys.parcel_details_service.tr(),
          style: AppTypography.of(context).headline2.dark_100(),
        ),
        const SizedBox(height: Dimens.spacingS),
        Text(
          parcel.service ?? "",
          style: AppTypography.of(context).body1.dark_100(),
        ),
        if (parcel.datetimeSend != null) ...[
          const Divider(),
          Text(
            LocaleKeys.parcel_details_datetime_send.tr(),
            style: AppTypography.of(context).headline2.dark_100(),
          ),
          const SizedBox(height: Dimens.spacingS),
          Text(
            formatterDate.format(parcel.datetimeSend!),
            style: AppTypography.of(context).body1.dark_100(),
          ),
        ],
        const Divider(),
        Text(
          LocaleKeys.parcel_details_sender_data.tr(),
          style: AppTypography.of(context).headline2.dark_100(),
        ),
        const SizedBox(height: Dimens.spacingS),
        Text(
          "${parcel.sender?.name} ${parcel.sender?.surname}",
          style: AppTypography.of(context).body1.dark_100(),
        ),
        const Divider(),
        Text(
          LocaleKeys.parcel_details_receiver_data.tr(),
          style: AppTypography.of(context).headline2.dark_100(),
        ),
        const SizedBox(height: Dimens.spacingS),
        Text(
          "${parcel.receiver?.name} ${parcel.receiver?.surname}",
          style: AppTypography.of(context).body1.dark_100(),
        ),
        Text(
          LocaleKeys.parcel_details_parcel_data.tr(),
          style: AppTypography.of(context).headline2.dark_100(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.parcel_details_width.tr(),
              style: AppTypography.of(context).body1.dark_100(),
            ),
            Text(
              parcel.details?.width?.toString() ?? "",
              style: AppTypography.of(context).body1.dark_100(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.parcel_details_height.tr(),
              style: AppTypography.of(context).body1.dark_100(),
            ),
            Text(
              parcel.details?.height?.toString() ?? "",
              style: AppTypography.of(context).body1.dark_100(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.parcel_details_depth.tr(),
              style: AppTypography.of(context).body1.dark_100(),
            ),
            Text(
              parcel.details?.depth?.toString() ?? "",
              style: AppTypography.of(context).body1.dark_100(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.parcel_details_weight.tr(),
              style: AppTypography.of(context).body1.dark_100(),
            ),
            Text(
              parcel.details?.weight?.toString() ?? "",
              style: AppTypography.of(context).body1.dark_100(),
            ),
          ],
        ),
      ],
    );
  }
}
