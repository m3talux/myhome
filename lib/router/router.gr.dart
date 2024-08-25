// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:myhome/models/models.dart' as _i6;
import 'package:myhome/screens/home_screen.dart' as _i1;
import 'package:myhome/screens/light_screen.dart' as _i2;
import 'package:myhome/screens/splash_screen.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LightScreen]
class LightRoute extends _i4.PageRouteInfo<LightRouteArgs> {
  LightRoute({
    _i5.Key? key,
    _i6.Light? light,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LightRoute.name,
          args: LightRouteArgs(
            key: key,
            light: light,
          ),
          initialChildren: children,
        );

  static const String name = 'LightRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LightRouteArgs>(orElse: () => const LightRouteArgs());
      return _i2.LightScreen(
        key: args.key,
        light: args.light,
      );
    },
  );
}

class LightRouteArgs {
  const LightRouteArgs({
    this.key,
    this.light,
  });

  final _i5.Key? key;

  final _i6.Light? light;

  @override
  String toString() {
    return 'LightRouteArgs{key: $key, light: $light}';
  }
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
