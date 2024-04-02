part of 'recommended_bloc.dart';

abstract class RecommendedEvent {}

class GetRecommendedArticlesEvent extends RecommendedEvent {}

class AddFavoriteEvent extends RecommendedEvent {
  AddFavoriteEvent(this.article);

  final Article article;
}
