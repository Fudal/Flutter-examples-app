// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../domain/app/capabilities/repo_item.dart' as _i5;
import '../presentation/home/home_page.dart' as _i1;
import '../presentation/repo_details/repo_details_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i1.HomePage()),
      );
    },
    RepoDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RepoDetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(
            child: _i2.RepoDetailsPage(
          key: args.key,
          repo: args.repo,
        )),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          RepoDetailsRoute.name,
          path: '/repo-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.RepoDetailsPage]
class RepoDetailsRoute extends _i3.PageRouteInfo<RepoDetailsRouteArgs> {
  RepoDetailsRoute({
    _i4.Key? key,
    required _i5.RepoItem repo,
  }) : super(
          RepoDetailsRoute.name,
          path: '/repo-details-page',
          args: RepoDetailsRouteArgs(
            key: key,
            repo: repo,
          ),
        );

  static const String name = 'RepoDetailsRoute';
}

class RepoDetailsRouteArgs {
  const RepoDetailsRouteArgs({
    this.key,
    required this.repo,
  });

  final _i4.Key? key;

  final _i5.RepoItem repo;

  @override
  String toString() {
    return 'RepoDetailsRouteArgs{key: $key, repo: $repo}';
  }
}
