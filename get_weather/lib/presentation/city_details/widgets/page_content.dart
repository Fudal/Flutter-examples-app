import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/presentation/city_details/widgets/daily_weather.dart';
import 'package:get_weather/presentation/city_details/widgets/info_tile.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';

class CityDetailsPageContent extends StatelessWidget {
  final CityItem city;

  const CityDetailsPageContent(this.city, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.spacingXs),
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
                        Text(
                          city.cityName ?? "",
                          style: context.typo.headline2.dark_100(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimens.spacingS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoTile(
                                label: LocaleKeys.city_details_page_temp.tr(),
                                value: "${city.currentWeather?.temp.toString()}${LocaleKeys.common_celsius.tr()}",
                              ),
                              InfoTile(
                                label: LocaleKeys.city_details_page_humidity.tr(),
                                value: city.currentWeather?.humidity.toString(),
                              ),
                              InfoTile(
                                label: LocaleKeys.city_details_page_pressure.tr(),
                                value: city.currentWeather?.pressure.toString(),
                              ),
                              InfoTile(
                                label: LocaleKeys.city_details_page_windSpeed.tr(),
                                value: city.currentWeather?.windSpeed.toString(),
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
          ),
          const SizedBox(height: Dimens.spacingL),
          if (city.forecastWeather != null)
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, index) => DailyWeather(city.forecastWeather![index]),
              separatorBuilder: (_,__) => const Divider(),
              itemCount: city.forecastWeather?.length ?? 0,
            )
        ],
      ),
    );
  }
}
