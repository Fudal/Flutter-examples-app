import 'package:my_parcels/domain/app/capabilities/parcel/parcel_details_item.dart';
import 'package:my_parcels/domain/app/capabilities/person_item.dart';

class ParcelItem {
  final int? id;
  final String? service;
  final DateTime? datetimeSend;
  final PersonItem? sender;
  final PersonItem? receiver;
  final ParcelDetailsItem? details;

  ParcelItem({
    this.id,
    this.service,
    this.datetimeSend,
    this.sender,
    this.receiver,
    this.details,
  });
}
