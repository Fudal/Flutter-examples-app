// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../domain/app/capabilities/parcel/parcel_item.dart' as _i5;
import '../presentations/home/home_page.dart' as _i1;
import '../presentations/parcel_details/parcel_details_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ParcelDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ParcelDetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ParcelDetailsPage(key: args.key, parcel: args.parcel));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeRoute.name, path: '/'),
        _i3.RouteConfig(ParcelDetailsRoute.name, path: '/parcel-details-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ParcelDetailsPage]
class ParcelDetailsRoute extends _i3.PageRouteInfo<ParcelDetailsRouteArgs> {
  ParcelDetailsRoute({_i4.Key? key, required _i5.ParcelItem parcel})
      : super(ParcelDetailsRoute.name,
            path: '/parcel-details-page',
            args: ParcelDetailsRouteArgs(key: key, parcel: parcel));

  static const String name = 'ParcelDetailsRoute';
}

class ParcelDetailsRouteArgs {
  const ParcelDetailsRouteArgs({this.key, required this.parcel});

  final _i4.Key? key;

  final _i5.ParcelItem parcel;

  @override
  String toString() {
    return 'ParcelDetailsRouteArgs{key: $key, parcel: $parcel}';
  }
}
