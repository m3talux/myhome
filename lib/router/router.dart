import 'package:auto_route/auto_route.dart';
import 'package:myhome/router/router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          initial: true,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: LightsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
        )
      ];
}
