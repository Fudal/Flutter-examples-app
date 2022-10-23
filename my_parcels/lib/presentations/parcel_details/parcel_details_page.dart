import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/generated/locale_keys.g.dart';
import 'package:my_parcels/presentations/parcel_details/widgets/page_content.dart';
import 'package:my_parcels/style/colors.dart';
import 'package:my_parcels/style/dimens.dart';
import 'package:my_parcels/style/typography.dart';

class ParcelDetailsPage extends StatelessWidget {
  final ParcelItem parcel;
  const ParcelDetailsPage({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.dark_100),
          onPressed: () => context.router.pop(),
        ),
        title: Text(
          LocaleKeys.parcel_details_title.tr(),
          style: AppTypography.of(context).body1.dark_100(),
        ),
      ),
      body: Material(
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacingL),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background_100,
                      borderRadius: BorderRadius.circular(Dimens.spacingS),
                    ),
                    padding: const EdgeInsets.all(Dimens.spacingM),
                    child: ParcelDetailsPageContent(parcel),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
