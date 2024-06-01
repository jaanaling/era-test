enum Routes {
  notifications(
    path: '/notifications',
    route: '/notifications',
    screenName: 'NotificationsScreen',
  ),
  news(
    path: 'news',
    route: '/notifications/news',
    screenName: 'NewsScreen',
  ),
  unknown(
    path: '/unknown',
    route: '/unknown',
    screenName: 'UnknownScreen',
  );

  const Routes({
    required this.path,
    required this.route,
    required this.screenName,
  });

  final String path;
  final String route;
  final String screenName;

  static String getRouteByScreenName(String? screenName) {
    return Routes.values
        .firstWhere(
          (element) => element.screenName == screenName,
          orElse: () => Routes.unknown,
        )
        .route;
  }

  static String getScreenNameByRoute(String? route) {
    return Routes.values.firstWhere(
      (element) => element.route == route,
      orElse: () {
        return Routes.unknown;
      },
    ).screenName;
  }
}
