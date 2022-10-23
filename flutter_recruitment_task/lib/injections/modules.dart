import 'package:flutter_recruitment_task/injections/modules.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

void registerModules(GetIt injector) {
  configureInjection(injector);
}

@injectableInit
void configureInjection(GetIt getIt) => $initGetIt(getIt);
