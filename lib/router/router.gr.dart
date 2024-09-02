// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:myhome/screens/home_screen.dart' as _i1;
import 'package:myhome/screens/lights_screen.dart' as _i2;
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
/// [_i2.LightsScreen]
class LightsRoute extends _i4.PageRouteInfo<LightsRouteArgs> {
  LightsRoute({
    _i5.Key? key,
    required int roomIdx,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LightsRoute.name,
          args: LightsRouteArgs(
            key: key,
            roomIdx: roomIdx,
          ),
          initialChildren: children,
        );

  static const String name = 'LightsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LightsRouteArgs>();
      return _i2.LightsScreen(
        key: args.key,
        roomIdx: args.roomIdx,
      );
    },
  );
}

class LightsRouteArgs {
  const LightsRouteArgs({
    this.key,
    required this.roomIdx,
  });

  final _i5.Key? key;

  final int roomIdx;

  @override
  String toString() {
    return 'LightsRouteArgs{key: $key, roomIdx: $roomIdx}';
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
