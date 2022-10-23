import 'package:injectable/injectable.dart';
import 'package:my_parcels/app_initializers/app_initializer.dart';
import 'package:my_parcels/app_initializers/app_initializer_container.dart';
import 'package:my_parcels/app_initializers/localization_initializer.dart';

@module
abstract class InitializerModule {
  @injectable
  LocalizationInitializer localizationInitializer() => LocalizationInitializer();

  @injectable
  List<AppInitializer> initializers(LocalizationInitializer localization) =>
      [localization];

  @injectable
  AppInitializer container(List<AppInitializer> initializers) => AppInitializerContainer(initializers);
}
