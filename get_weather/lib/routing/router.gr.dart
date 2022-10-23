// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../domain/app/capabilities/city_item.dart' as _i6;
import '../presentation/city_details/city_details_page.dart' as _i3;
import '../presentation/city_form/city_form_page.dart' as _i2;
import '../presentation/home/home_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    CityFormRoute.name: (routeData) {
      final args = routeData.argsAs<CityFormRouteArgs>(
          orElse: () => const CityFormRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CityFormPage(key: args.key, item: args.item));
    },
    CityDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CityDetailsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.CityDetailsPage(args.city, key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(CityFormRoute.name, path: '/city-form-page'),
        _i4.RouteConfig(CityDetailsRoute.name, path: '/city-details-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CityFormPage]
class CityFormRoute extends _i4.PageRouteInfo<CityFormRouteArgs> {
  CityFormRoute({_i5.Key? key, _i6.CityItem? item})
      : super(CityFormRoute.name,
            path: '/city-form-page',
            args: CityFormRouteArgs(key: key, item: item));

  static const String name = 'CityFormRoute';
}

class CityFormRouteArgs {
  const CityFormRouteArgs({this.key, this.item});

  final _i5.Key? key;

  final _i6.CityItem? item;

  @override
  String toString() {
    return 'CityFormRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i3.CityDetailsPage]
class CityDetailsRoute extends _i4.PageRouteInfo<CityDetailsRouteArgs> {
  CityDetailsRoute({required _i6.CityItem city, _i5.Key? key})
      : super(CityDetailsRoute.name,
            path: '/city-details-page',
            args: CityDetailsRouteArgs(city: city, key: key));

  static const String name = 'CityDetailsRoute';
}

class CityDetailsRouteArgs {
  const CityDetailsRouteArgs({required this.city, this.key});

  final _i6.CityItem city;

  final _i5.Key? key;

  @override
  String toString() {
    return 'CityDetailsRouteArgs{city: $city, key: $key}';
  }
}
