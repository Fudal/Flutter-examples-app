import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:my_parcels/data/network/service/api_network_service.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_details_item.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/domain/app/capabilities/person_item.dart';

abstract class AppParcelsRepository {
  Future<List<ParcelItem>> getParcels({
    required int page,
    required int limit,
  });
}

@LazySingleton(as: AppParcelsRepository)
class AppParcelsRepositoryImpl implements AppParcelsRepository {
  final ApiNetworkService _apiNetworkService;

  AppParcelsRepositoryImpl(this._apiNetworkService);

  @override
  Future<List<ParcelItem>> getParcels({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _apiNetworkService
          .getParcels(page: page, limit: limit);
      return result.map((e) => ParcelItem(
        id: e.id,
        datetimeSend: e.datetimeSend != null
            ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(e.datetimeSend!)
            : null,
        details: ParcelDetailsItem(
          width: e.parcels.width,
          height: e.parcels.height,
          depth: e.parcels.depth,
          packageNo: e.parcels.packageNo,
          weight: e.parcels.weight,
        ),
        receiver: PersonItem(
          name: e.receiver.name,
          surname: e.receiver.surname,
        ),
        sender: PersonItem(
          name: e.sender.name,
          surname: e.sender.surname,
        ),
        service: e.service,
      ),).toList();
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
