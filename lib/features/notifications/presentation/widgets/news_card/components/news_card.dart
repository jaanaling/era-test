import 'package:era_test/features/notifications/models/article_model.dart';
import 'package:era_test/features/notifications/presentation/widgets/features_loader/features_loader.dart';
import 'package:era_test/features/notifications/theme/theme.dart';
import 'package:era_test/router/routes.dart';
import 'package:era_test/theme/theme.dart';
import 'package:era_test/utils/ext/time_ago_parse.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

var _feature = StandartTheme().Notifications;

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  final Color color;

  const NewsCard({
    required this.article,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        Routes.news.route,
        extra: article,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 35, 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
              color: _feature.color.shadowFirstCardColor,
              offset: const Offset(4, 4),
              blurRadius: 20,
            ),
            BoxShadow(
              color: _feature.color.shadowSecondCardColor,
              offset: const Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                article.imageUrl,
                width: 90,
                height: 60,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 90,
                    height: 60,
                    child: FeaturesLoader(),
                  );
                },
              ),
            ),
            const Gap(23),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: _feature.text.cardTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Gap(11),
                  Text(
                    timeAgo(article.publicationDate),
                    style: _feature.text.cardSubtitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
