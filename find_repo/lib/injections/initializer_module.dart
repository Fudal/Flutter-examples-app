import 'package:find_repo/app_initializers/app_initializer.dart';
import 'package:find_repo/app_initializers/app_initializer_container.dart';
import 'package:find_repo/app_initializers/localization_initializer.dart';
import 'package:injectable/injectable.dart';

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
