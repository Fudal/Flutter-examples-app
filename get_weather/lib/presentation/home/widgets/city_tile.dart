import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/routing/router.gr.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';
import 'package:get_weather/widgets/custom_dialog.dart';

class CityTile extends StatelessWidget {
  final CityItem city;
  final Function(bool) changeFavorite;
  final Function() deleteCallback;
  final Function(CityItem) editCallback;

  const CityTile({
    super.key,
    required this.city,
    required this.changeFavorite,
    required this.deleteCallback,
    required this.editCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.spacingS),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(Dimens.spacingS),
        child: InkWell(
          onTap: () => context.router.push(CityDetailsRoute(city: city)),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacingS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => changeFavorite.call(!(city.isFavorite ?? false)),
                          icon: Icon(Icons.star, color: city.isFavorite ?? false
                              ? Colors.amber
                              : Colors.grey,
                          ),
                        ),
                        Text(
                          city.cityName ?? "",
                          style: context.typo.headline2.dark_100(),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimens.spacingS),
                      child: Text(
                        "${city.currentWeather?.temp.toString()}${LocaleKeys.common_celsius.tr()}",
                        style: context.typo.body2.dark_50(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final item = await context.router.push(CityFormRoute(item: city));
                        if (item != null && item is CityItem) {
                          editCallback.call(item);
                        }
                      },
                      child: Text(
                        LocaleKeys.home_page_edit.tr(),
                        style: context.typo.body2,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        CustomDialog(
                          message: LocaleKeys.home_page_remove_dialog_title.tr(),
                          leftButtonText: LocaleKeys.common_yes.tr(),
                          rightButtonText: LocaleKeys.common_no.tr(),
                          onLeftButtonClick: () {
                            deleteCallback.call();
                            Navigator.of(context).pop();
                          },
                          onRightButtonClick: () => Navigator.of(context).pop(),
                        ).show(context);
                      },
                      child: Text(
                        LocaleKeys.home_page_remove.tr(),
                        style: context.typo.body2.error_100(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
