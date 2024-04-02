part of 'read_later_bloc.dart';

abstract class ReadLaterEvent {}

class GetReadLaterArticleEvent extends ReadLaterEvent {}

class RemoveFavoriteEvent extends ReadLaterEvent {
  RemoveFavoriteEvent(this.article);

  final Article article;
}
