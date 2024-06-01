import 'package:easy_localization/easy_localization.dart';
import 'package:era_test/features/notifications/bloc/articles_bloc/articles_bloc.dart';
import 'package:era_test/features/notifications/presentation/widgets/app_bar/notifications_app_bar.dart';
import 'package:era_test/features/notifications/presentation/widgets/features_loader/features_loader.dart';
import 'package:era_test/features/notifications/presentation/widgets/features_news/features_new.dart';
import 'package:era_test/features/notifications/presentation/widgets/latest_loader/components/latest_loader.dart';
import 'package:era_test/features/notifications/presentation/widgets/news_card/components/news_card.dart';
import 'package:era_test/features/notifications/theme/theme.dart';
import 'package:era_test/generated/translations/locale_keys.g.dart';
import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

var _feature = StandartTheme().Notifications;

class NotificationsScreen extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 1.23);

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc()..add(GetAllArticlesEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: NotificationsAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28.0, 21.0, 28.0, 0.0),
            child: BlocBuilder<ArticlesBloc, ArticlesState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state is GetAllArticlesState)
                      state.featuresArticles.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.featured.tr(),
                                  style: _feature.text.bodyTitleTextStyle,
                                ),
                                const Gap(20),
                                SizedBox(
                                  height: 300,
                                  child: PageView(
                                    onPageChanged: (value) {
                                      _pageController.jumpToPage(0);
                                      context.read<ArticlesBloc>().add(
                                            SetArticleReadedEvent(
                                              state.featuresArticles[0].id,
                                            ),
                                          );
                                    },
                                    controller: _pageController,
                                    children: List.generate(
                                      state.featuresArticles.length,
                                      (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        child: FeaturesNew(
                                          article:
                                              state.featuresArticles[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(20),
                              ],
                            )
                          : const SizedBox()
                    else
                      const FeaturesLoader(),
                    Text(
                      LocaleKeys.latest_news.tr(),
                      style: _feature.text.bodyTitleTextStyle,
                    ),
                    const Gap(20),
                    if (state is GetAllArticlesState)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.latestArticles.length,
                        separatorBuilder: (_, __) => const Gap(20),
                        itemBuilder: (_, int index) => NewsCard(
                          article: state.latestArticles[index],
                          color: index.isEven
                              ? _feature.color.cardFirstColor
                              : _feature.color.cardSecondColor,
                        ),
                      )
                    else
                      const LatestLoader(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
