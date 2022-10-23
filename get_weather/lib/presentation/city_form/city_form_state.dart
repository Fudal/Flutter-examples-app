part of 'city_form_cubit.dart';

abstract class CityFormState extends Equatable {
  const CityFormState();
}

class CityFormInitial extends CityFormState {
  @override
  List<Object> get props => [];
}

class CityFormLoading extends CityFormState {
  @override
  List<Object> get props => [];
}

class CityFormLoaded extends CityFormState {
  final CityItem city;

  const CityFormLoaded(this.city);

  @override
  List<Object> get props => [city];
}

class CityFormError extends CityFormState {
  final dynamic error;

  const CityFormError(this.error);

  @override
  List<Object> get props => [];
}
