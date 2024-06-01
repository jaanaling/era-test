part of 'articles_bloc.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class GetAllArticlesState extends ArticlesState {
  final List<ArticleModel> featuresArticles;
  final List<ArticleModel> latestArticles;

  GetAllArticlesState({
    required this.featuresArticles,
    required this.latestArticles,
  });
}
