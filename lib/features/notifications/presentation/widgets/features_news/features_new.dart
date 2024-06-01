import 'package:era_test/features/notifications/bloc/articles_bloc/articles_bloc.dart';
import 'package:era_test/features/notifications/models/article_model.dart';
import 'package:era_test/features/notifications/presentation/widgets/features_loader/features_loader.dart';
import 'package:era_test/features/notifications/theme/theme.dart';
import 'package:era_test/router/routes.dart';
import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

var _feature = StandartTheme().Notifications;

class FeaturesNew extends StatelessWidget {
  final ArticleModel article;

  const FeaturesNew({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ArticlesBloc>().add(SetArticleReadedEvent(article.id));
        context.push(
          Routes.news.route,
          extra: article,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              article.imageUrl,
              height: 300,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.25),
              colorBlendMode: BlendMode.darken,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const FeaturesLoader();
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Text(
                  article.title,
                  style: _feature.text.featuredTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
