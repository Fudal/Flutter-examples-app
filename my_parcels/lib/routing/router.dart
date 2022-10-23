import 'package:auto_route/auto_route.dart';
import 'package:my_parcels/presentations/home/home_page.dart';
import 'package:my_parcels/presentations/parcel_details/parcel_details_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<dynamic>(page: HomePage, initial: true),
    AutoRoute<dynamic>(page: ParcelDetailsPage),
  ],
)
class $AppRouter {}
