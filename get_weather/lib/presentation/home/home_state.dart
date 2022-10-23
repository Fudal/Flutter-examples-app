part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoaded extends HomeState {
  final List<CityItem> items;

  const HomeLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final dynamic error;

  const HomeError(this.error);

  @override
  List<Object> get props => [];
}
