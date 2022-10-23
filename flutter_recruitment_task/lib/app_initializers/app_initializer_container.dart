import 'package:fimber/fimber.dart';
import 'package:flutter_recruitment_task/app_initializers/app_initializer.dart';

class AppInitializerContainer extends AppInitializer {
  final List<AppInitializer> initializers;

  AppInitializerContainer(this.initializers);

  @override
  Future<void> init() async {
    try {
      await Future.forEach(initializers, (AppInitializer initializer) async {
        await initializer.init();
      });
    } catch (e, stack) {
      Fimber.e("AppInitializerContainer error", ex: e, stacktrace: stack);
    }
  }
}
