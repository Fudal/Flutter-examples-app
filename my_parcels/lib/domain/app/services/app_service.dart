import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_parcels/data/network/exceptions/network_exception.dart';
import 'package:my_parcels/data/network/repository/parcels_repository.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/domain/base/errors/connection_exception.dart';
import 'package:my_parcels/domain/base/errors/network_exception.dart';
import 'package:my_parcels/domain/base/errors/server_exception.dart';

@injectable
class AppService {
  final AppParcelsRepository _appParcelsRepository;

  AppService(this._appParcelsRepository);

  Future<List<ParcelItem>> getParcels({
    required int page,
    required int limit,
  }) async {
    try {
      return await _appParcelsRepository.getParcels(page: page, limit: limit);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }
}
