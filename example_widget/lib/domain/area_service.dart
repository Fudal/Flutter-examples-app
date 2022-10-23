import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/domain/models/area_item.dart';
import 'package:fh_home_coding/domain/models/device_item.dart';
import 'package:fh_home_coding/domain/models/person_item.dart';
import 'package:fh_home_coding/generated/locale_keys.g.dart';
import 'package:fh_home_coding/style/app_images.dart';

class AreaService {
  AreaService();

  AreaItem getArea() {
    return AreaItem(
      iconPath: AppImages.area,
      name: LocaleKeys.area_title.tr(),
      notesCount: 8,
      owner: PersonItem(
        name: LocaleKeys.devices_board_member.tr(),
        priority: 1,
        email: "mario@castle.com",
        phone: "+47 444 44 444",
        updatedAt: DateTime(1970),
      ),
      devices: [
        DeviceItem(
          name: LocaleKeys.devices_smoke_detector.tr(),
          isModified: true,
          isConfigured: true,
          address: "2_0",
          id: 1,
          notesCount: 8,
          isOnline: false,
          isSecured: false,
          allowDelete: true,
          allowSensitivity: true,
          allowTestSiren: true,
        ),
        DeviceItem(
          name: LocaleKeys.devices_water_leak_detector.tr(),
          isModified: false,
          isConfigured: true,
          address: "2_0",
          id: 1,
          notesCount: 8,
          isOnline: true,
          isSecured: true,
          allowTestSiren: false,
          allowSensitivity: false,
          allowDelete: false,
        ),
      ],
    );
  }
}
