import 'package:era_test/core/widgets/core_scaffold.dart';
import 'package:era_test/features/news/presentation/screen/news_screen.dart';
import 'package:era_test/features/notifications/models/article_model.dart';
import 'package:era_test/features/notifications/presentation/screen/notifications_screen.dart';
import 'package:era_test/features/unknown/presentation/screen/unknown_screen.dart';
import 'package:era_test/router/routes.dart';
import 'package:era_test/router/transitions/no_transition.dart';
import 'package:era_test/router/transitions/slide.dart';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.notifications.path,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          name: Routes.notifications.name,
          path: Routes.notifications.path,
          pageBuilder: (context, state) {
            return slideTransition(
              context,
              state,
              NotificationsScreen(
                key: UniqueKey(),
              ),
            );
          },
          routes: [
            GoRoute(
              name: Routes.news.name,
              path: Routes.news.path,
              pageBuilder: (context, state) {
                return slideTransition(
                  context,
                  state,
                  NewsScreen(
                    article: state.extra! as ArticleModel,
                    key: UniqueKey(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder: (context, state, child) {
        return slideTransition(
          context,
          state,
          CoreScaffold(
            body: child,
          ),
        );
      },
    ),
    ShellRoute(
      routes: [
        GoRoute(
          name: Routes.unknown.name,
          path: Routes.unknown.path,
          pageBuilder: (context, state) {
            return noTransition(
              context,
              state,
              UnknownScreen(
                key: UniqueKey(),
              ),
            );
          },
        ),
      ],
      pageBuilder: (context, state, child) {
        return noTransition(
          context,
          state,
          CoreScaffold(
            body: child,
          ),
        );
      },
    ),
  ],
);
