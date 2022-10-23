import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_parcels/data/network/response/parcel_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_network_service.g.dart';

@singleton
@RestApi()
abstract class ApiNetworkService {
  @factoryMethod
  factory ApiNetworkService(Dio dio) {
    return _ApiNetworkService(dio);
  }

  @GET('/packages?page={page}&limit={limit}')
  Future<List<ParcelResponse>> getParcels({
    @Path("page") required int page,
    @Path("limit") required int limit,
});
}
