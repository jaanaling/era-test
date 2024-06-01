import 'package:era_test/features/notifications/data_provider/articles_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:era_test/features/notifications/models/article_model.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final repository = ArticlesRepository();

  ArticlesBloc() : super(ArticlesInitial()) {
    on<GetAllArticlesEvent>((event, emit) async {
      Future.delayed(const Duration(seconds: 1));
      final rArticles = await sortedArticles();
      emit(
        GetAllArticlesState(
          featuresArticles: rArticles.$1,
          latestArticles: rArticles.$2,
        ),
      );
    });

    on<SetArticleReadedEvent>((event, emit) async {
      repository.setArticleReaded(event.id);
      final rArticles = await sortedArticles();
      emit(
        GetAllArticlesState(
          featuresArticles: rArticles.$1,
          latestArticles: rArticles.$2,
        ),
      );
    });

    on<SetAllArticlesReadedEvent>((event, emit) async {
      await repository.setAllArticlesReaded();
      final rArticles = await sortedArticles();
      emit(
        GetAllArticlesState(
          featuresArticles: rArticles.$1,
          latestArticles: rArticles.$2,
        ),
      );
    });
  }

  Future<(List<ArticleModel>, List<ArticleModel>)> sortedArticles() async {
    final featuresArticles = await repository.getFeaturedArticles();
    final latestArticles = await repository.getLatestArticles();

    latestArticles.sort(
      (a, b) => b.changeDate.compareTo(a.changeDate),
    );
    return (featuresArticles, latestArticles);
  }
}
