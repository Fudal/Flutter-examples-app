import 'package:dio/dio.dart';
import 'package:get_weather/data/network/response/city_details_response.dart';
import 'package:get_weather/data/network/response/city_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_network_service.g.dart';

@singleton
@RestApi()
abstract class ApiNetworkService {
  @factoryMethod
  factory ApiNetworkService(Dio dio) {
    return _ApiNetworkService(dio);
  }

  @GET('weather?q={cityName}&units=metric&APPID={appId}')
  Future<CityResponse> getCity({
    @Path("cityName") required String cityName,
    @Path("appId") required String appId,
  });

  @GET('onecall?lat={lat}&lon={lon}&exclude=alerts,minutely,hourly&units=metric&APPID={appId}')
  Future<CityDetailsResponse> getCityDetails({
    @Path("lat") required double lat,
    @Path("lon") required double lon,
    @Path("appId") required String appId,
  });
}
