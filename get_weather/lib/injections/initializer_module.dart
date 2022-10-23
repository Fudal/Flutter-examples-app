import 'package:get_weather/app_initializers/app_initializer.dart';
import 'package:get_weather/app_initializers/app_initializer_container.dart';
import 'package:get_weather/app_initializers/hive_initializer.dart';
import 'package:get_weather/app_initializers/localization_initializer.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InitializerModule {
  @injectable
  LocalizationInitializer localizationInitializer() => LocalizationInitializer();

  @injectable
  HiveInitializer hiveInitializer() => HiveInitializer();


  @injectable
  List<AppInitializer> initializers(LocalizationInitializer localization, HiveInitializer hive) =>
      [localization, hive];

  @injectable
  AppInitializer container(List<AppInitializer> initializers) => AppInitializerContainer(initializers);
}
