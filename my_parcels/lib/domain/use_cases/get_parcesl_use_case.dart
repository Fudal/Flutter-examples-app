import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/domain/app/services/application_service.dart';

@injectable
class GetParcelsUseCase {
  final AppApi _appApi;

  GetParcelsUseCase(this._appApi);

  Future<List<ParcelItem>> call({
    required int page,
    required int limit,
  }) async {
    final List<ParcelItem> response = await _appApi
        .getParcels(page: page, limit: limit);

    final List<ParcelItem> list = response
        .where((element) => element.datetimeSend != null).toList();
    final List<ParcelItem> listWithoutDate = response
        .where((element) => element.datetimeSend == null).toList();

    list.sort((a, b) => a.datetimeSend!.compareTo(b.datetimeSend!));

    final List<ParcelItem> sortedList = [];

    sortedList.addAll(list);
    sortedList.addAll(listWithoutDate);

    return sortedList;
  }
}
