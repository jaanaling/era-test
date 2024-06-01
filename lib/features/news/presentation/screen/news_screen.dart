import 'package:era_test/features/news/presentation/widgets/app_bar_news.dart';
import 'package:era_test/features/news/theme/theme.dart';
import 'package:era_test/features/notifications/models/article_model.dart';
import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';

var _feature = StandartTheme().News;

class NewsScreen extends StatelessWidget {
  final ArticleModel article;

  const NewsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          AppBarNews(title: article.title, imageUrl: article.imageUrl),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                article.description ?? '',
                style: _feature.text.textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
