part of 'articles_bloc.dart';

sealed class ArticlesEvent {}

final class GetAllArticlesEvent extends ArticlesEvent {}

final class SetAllArticlesReadedEvent extends ArticlesEvent {}

final class SetArticleReadedEvent extends ArticlesEvent {
  String id;

  SetArticleReadedEvent(this.id);
}
