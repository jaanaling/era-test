import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

NoTransitionPage noTransition(
  BuildContext context,
  GoRouterState state,
  Widget childWidget,
) {
  return NoTransitionPage(
    child: childWidget,
  );
}
