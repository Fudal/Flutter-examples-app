import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/domain/app/services/app_service.dart';
import 'package:injectable/injectable.dart';

part 'city_form_state.dart';

@injectable
class CityFormCubit extends Cubit<CityFormState> {
  final AppService _appService;

  CityFormCubit(this._appService) : super(CityFormInitial());

  Future<void> addCity(String name) async {
    try {
      emit(CityFormLoading());
      final CityItem city = await _appService.getCity(name);
      emit(CityFormLoaded(city));
    } catch (exc, stack) {
      Fimber.e("Add city error", ex: exc, stacktrace: stack);
      emit(CityFormError(exc));
    }
  }
}
