import 'package:injectable/injectable.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/domain/app/services/app_service.dart';

abstract class AppApi {
  Future<List<ParcelItem>> getParcels({
    required int page,
    required int limit,
  });
}

@LazySingleton(as: AppApi)
class AppApplicationService extends AppApi {
  final AppService _appService;

  AppApplicationService(this._appService);

  @override
  Future<List<ParcelItem>> getParcels({
    required int page,
    required int limit,
  }) {
    return _appService.getParcels(page: page, limit: limit);
  }
}
