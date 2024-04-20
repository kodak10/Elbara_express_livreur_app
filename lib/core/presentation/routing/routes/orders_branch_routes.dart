part of '../app_router.dart';

class OrdersRoute extends GoRouteData {
  const OrdersRoute();

  static const routes = [
    TypedGoRoute<OrdersRoute>(path: '/orders'),

  ];

  @override
  Widget build(BuildContext context, GoRouterState state) => const OrdersScreen();
}


