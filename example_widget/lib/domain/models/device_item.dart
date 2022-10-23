class DeviceItem {
  final String name;
  final bool isModified;
  final bool isConfigured;
  final String address;
  final int id;
  final int notesCount;
  final bool isOnline;
  final bool isSecured;
  final bool allowDelete;
  final bool allowSensitivity;
  final bool allowTestSiren;

  DeviceItem({
    required this.name,
    required this.isModified,
    required this.isConfigured,
    required this.address,
    required this.id,
    required this.notesCount,
    required this.isOnline,
    required this.isSecured,
    required this.allowDelete,
    required this.allowSensitivity,
    required this.allowTestSiren,
  });
}
