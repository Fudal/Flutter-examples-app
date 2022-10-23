import 'package:fh_home_coding/domain/models/device_item.dart';
import 'package:fh_home_coding/domain/models/person_item.dart';

class AreaItem {
  final String iconPath;
  final String name;
  final PersonItem owner;
  final int notesCount;
  final List<DeviceItem> devices;

  AreaItem({
    required this.iconPath,
    required this.name,
    required this.owner,
    required this.notesCount,
    required this.devices,
  });
}
