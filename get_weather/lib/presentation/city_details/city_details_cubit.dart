import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/domain/app/services/app_service.dart';
import 'package:injectable/injectable.dart';

part 'city_details_state.dart';

@injectable
class CityDetailsCubit extends Cubit<CityDetailsState> {
  final AppService _appService;

  CityDetailsCubit(this._appService) : super(CityDetailsLoading());

  Future<void> loadDetails(CityItem item) async {
    try {
      if (item.latitude != null && item.longitude != null) {
        emit(CityDetailsLoading());
        final CityItem city = await _appService.getCityDetails(
          lat: item.latitude!,
          lon: item.longitude!,
        );
        emit(CityDetailsLoaded(city.copyWith(cityName: item.cityName)));
      }
    } catch (exc, stack) {
      Fimber.e("Load city details error", ex: exc, stacktrace: stack);
      emit(CityDetailsError(exc));
    }
  }
}
