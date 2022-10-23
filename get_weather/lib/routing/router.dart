import 'package:auto_route/auto_route.dart';
import 'package:get_weather/presentation/city_details/city_details_page.dart';
import 'package:get_weather/presentation/city_form/city_form_page.dart';
import 'package:get_weather/presentation/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<dynamic>(page: HomePage, initial: true),
    AutoRoute<dynamic>(page: CityFormPage),
    AutoRoute<dynamic>(page: CityDetailsPage),
  ],
)
class $AppRouter {}
