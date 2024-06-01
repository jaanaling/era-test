import 'package:era_test/features/notifications/data/mock_articles.dart';
import 'package:era_test/features/notifications/data_provider/abstract_news_repository.dart';
import 'package:era_test/features/notifications/models/article_model.dart';

class ArticlesRepository implements AbstractArticlesRepository {
  @override
  Future<List<ArticleModel>> getLatestArticles() async {
    return mockArticles.where((element) => element.readed == true).toList();
  }

  @override
  Future<List<ArticleModel>> getFeaturedArticles() async {
    return mockArticles.where((element) => element.readed == false).toList();
  }

  @override
  void setArticleReaded(String id) {
    mockArticles.firstWhere((element) => element.id == id)
      ..readed = true
      ..changeDate = DateTime.now();
  }

  @override
  Future<void> setAllArticlesReaded() async {
    for (final element in await getFeaturedArticles()) {
      element
        ..readed = true
        ..changeDate = DateTime.now();
    }
  }
}
