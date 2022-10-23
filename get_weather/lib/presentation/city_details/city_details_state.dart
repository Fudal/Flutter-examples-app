part of 'city_details_cubit.dart';

abstract class CityDetailsState extends Equatable {
  const CityDetailsState();
}

class CityDetailsLoading extends CityDetailsState {
  @override
  List<Object> get props => [];
}

class CityDetailsLoaded extends CityDetailsState {
  final CityItem cityDetails;

  const CityDetailsLoaded(this.cityDetails);

  @override
  List<Object> get props => [cityDetails];
}

class CityDetailsError extends CityDetailsState {
  final dynamic error;

  const CityDetailsError(this.error);

  @override
  List<Object> get props => [];
}
