import 'package:easy_localization/easy_localization.dart';
import 'package:era_test/features/notifications/bloc/articles_bloc/articles_bloc.dart';
import 'package:era_test/features/notifications/theme/theme.dart';
import 'package:era_test/generated/translations/locale_keys.g.dart';
import 'package:era_test/theme/theme.dart';
import 'package:era_test/utils/ext/icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

var _feature = StandartTheme().Notifications;

class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Align(
              child: SvgPicture.asset(
                IconProvider.backArrow.buildIconUrl(),
                colorFilter: ColorFilter.mode(
                  _feature.color.iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        // ignore: avoid_print
        onTap: () => context.canPop() ? context.pop() : print('can not pop'),
      ),
      title: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            LocaleKeys.notifications.tr(),
            style: _feature.text.titleTextStyle,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () =>
                context.read<ArticlesBloc>()..add(SetAllArticlesReadedEvent()),
            child: Text(
              LocaleKeys.mark_all_read.tr(),
              style: _feature.text.actionTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
