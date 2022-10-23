part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeIdle extends HomeState {
  final List<ParcelItem> parcels;

  const HomeIdle(this.parcels);

  @override
  List<Object> get props => [parcels];
}

class HomeLoadingMore extends HomeState {
  final List<ParcelItem> parcels;

  const HomeLoadingMore(this.parcels);

  @override
  List<Object> get props => [parcels];
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
