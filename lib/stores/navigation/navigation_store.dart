import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  int homeRoute = 0;

  @action
  void setHomeRoute(int index) {
    homeRoute = index;
  }
}
