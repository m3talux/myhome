// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  late final _$homeRouteAtom =
      Atom(name: '_NavigationStore.homeRoute', context: context);

  @override
  int get homeRoute {
    _$homeRouteAtom.reportRead();
    return super.homeRoute;
  }

  @override
  set homeRoute(int value) {
    _$homeRouteAtom.reportWrite(value, super.homeRoute, () {
      super.homeRoute = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setHomeRoute(int index) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setHomeRoute');
    try {
      return super.setHomeRoute(index);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeRoute: ${homeRoute}
    ''';
  }
}
