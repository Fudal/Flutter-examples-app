import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/domain/use_cases/get_parcesl_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetParcelsUseCase _getParcelsUseCase;

  List<ParcelItem> items = [];
  bool hasMore = true;

  HomeCubit(this._getParcelsUseCase) : super(HomeLoading());

  static const limit = 30;

  Future<void> loadParcels() async {
    try {
      items = await _getParcelsUseCase(page: 1, limit: limit);
      emit(HomeIdle(items));
    } catch (exc, stack) {
      Fimber.e("Load Parcels error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }

  Future<void> loadMore() async {
    try {
      if (!hasMore) {
        emit(HomeIdle(items));
      } else {
        emit(HomeLoadingMore(items));
        if (items.isNotEmpty) {
          final int? page = int.tryParse((items.length/limit).toStringAsFixed(0));
          final result = await _getParcelsUseCase(page: page ?? 1, limit: limit);
          hasMore = result.isNotEmpty;
          items.addAll(result);
          emit(HomeIdle(items));
        }
      }
    } catch (exc, stack) {
      Fimber.e("Load More Parcels error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }
}
