import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

Page slideTransition(
  BuildContext context,
  GoRouterState state,
  Widget childWidget,
) {
  if (Platform.isIOS) {
    return CupertinoPage(
      child: childWidget,
    );
  } else {
    return CustomTransitionPage(
      child: childWidget,
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeOutCubic),
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    );
  }
}
