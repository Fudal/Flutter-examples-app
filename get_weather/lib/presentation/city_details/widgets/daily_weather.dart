import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_weather/domain/app/capabilities/weather_item.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/presentation/city_details/widgets/info_tile.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';

class DailyWeather extends StatelessWidget {
  final WeatherItem item;

  const DailyWeather(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatterDay = DateFormat(
      "yyyy-MM-dd",
      Localizations.localeOf(context).languageCode,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingS),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.spacingS),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(Dimens.spacingS),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacingS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.date != null)
                    Text(
                      formatterDay.format(item.date!),
                      style: context.typo.body1.dark_100(),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.spacingS),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoTile(
                          label: LocaleKeys.city_details_page_temp.tr(),
                          value: "${item.temp.toString()}${LocaleKeys.common_celsius.tr()}",
                        ),
                        InfoTile(
                          label: LocaleKeys.city_details_page_humidity.tr(),
                          value: item.humidity.toString(),
                        ),
                        InfoTile(
                          label: LocaleKeys.city_details_page_pressure.tr(),
                          value: item.pressure.toString(),
                        ),
                        InfoTile(
                          label: LocaleKeys.city_details_page_windSpeed.tr(),
                          value: item.windSpeed.toString(),
                        ),
                        if (item.tempFeelsLike != null)
                          InfoTile(
                            label: LocaleKeys.city_details_page_tempFeelsLike.tr(),
                            value: item.tempFeelsLike.toString(),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
