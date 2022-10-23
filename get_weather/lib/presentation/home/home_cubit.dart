import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:get_weather/data/storage/cities_storage.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final CitiesStorage _storage;

  List<CityItem> _items = [];

  HomeCubit(this._storage) : super(HomeLoading());

  Future<void> loadCities() async {
    try {
      emit(HomeLoading());
      _items = await _storage.loadUserCities();
      emit(HomeLoaded(_items));
    } catch (exc, stack) {
      Fimber.e("Load cities error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }

  Future<void> switchFavoriteCity(List<CityItem> cities) async {
    try {
      _items = cities;
      await _storage.saveUserCities(_items);
      emit(HomeLoaded(_items));
    } catch (exc, stack) {
      Fimber.e("Add favorite city error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }


  Future<void> saveCities(List<CityItem> cities) async {
    try {
      emit(HomeLoading());
      _items = cities;
      await _storage.saveUserCities(_items);
      emit(HomeLoaded(_items));
    } catch (exc, stack) {
      Fimber.e("Load cities error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }
}
