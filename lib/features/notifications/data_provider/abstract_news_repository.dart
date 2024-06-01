import 'package:era_test/features/notifications/models/article_model.dart';

abstract class AbstractArticlesRepository {
  Future<List<ArticleModel>> getLatestArticles();
  Future<List<ArticleModel>> getFeaturedArticles();
  void setArticleReaded(String id);
  void setAllArticlesReaded();
}
