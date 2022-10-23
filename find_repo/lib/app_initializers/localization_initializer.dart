import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/app_initializers/app_initializer.dart';

class LocalizationInitializer extends AppInitializer {
  @override
  Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }
}
