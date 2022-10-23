import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/area_item.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/presentation/home/widgets/area_tile.dart';
import 'package:fh_home_coding/presentation/home/widgets/device/device_tile.dart';
import 'package:fh_home_coding/presentation/home/widgets/member_tile.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final AreaItem? area;

  const HomeContent({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    if (area == null) {
      return Center(child: Text(LocaleKeys.common_empty_areas.tr()));
    } else {
      return Padding(
        padding: const EdgeInsets.all(Dimens.spacingS),
        child: CustomScrollView(
          key: const Key("home_content"),
          slivers: [
            SliverToBoxAdapter(child: AreaTile(area: area!)),
            SliverToBoxAdapter(child: MemberTile(person: area!.owner)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => DeviceTile(device: area!.devices[index]),
                childCount: area!.devices.length,
              ),
            ),
          ],
        ),
      );
    }
  }
}
