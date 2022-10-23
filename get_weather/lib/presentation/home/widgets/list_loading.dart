import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/presentation/home/widgets/city_tile.dart';
import 'package:get_weather/style/dimens.dart';

class HomeListLoading extends StatelessWidget {
  final List<CityItem> items;
  final Function(List<CityItem>) callback;

  const HomeListLoading(this.items, {super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    if (items.isNotEmpty) {
      return ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingM),
        itemBuilder: (context, index) => CityTile(
          city: items[index],
          changeFavorite: (val) {
            final item = items[index].copyWith(isFavorite: val);
            final list = items;
            list[index] = item;
            callback.call(list);
          },
          deleteCallback: () {
            final list = items;
            list.remove(list[index]);
            callback.call(list);
          },
          editCallback: (val) {
            final list = items;
            list[index] = val;
            callback.call(list);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: items.length,
      );
    } else {
     return Column(
       children: [
         const Spacer(),
         Center(child: Text(LocaleKeys.home_page_empty_list.tr()),),
         const Spacer(),
       ],
     );
    }
  }
}
