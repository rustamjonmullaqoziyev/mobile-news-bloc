part of 'recommended_bloc.dart';

abstract class RecommendedState {}

@freezed
class RecommendedBuildable extends RecommendedState
    with _$RecommendedBuildable {
  const factory RecommendedBuildable({
    @Default([]) List<Article> recommendedArticles,
    @Default(LoadingState.loading) LoadingState recommendedArticlesState,
  }) = _RecommendedBuildable;
}

@freezed
class RecommendedListenable extends RecommendedState
    with _$RecommendedListenable {
  const factory RecommendedListenable({
    required RecommendedEffect effect,
    String? message,
  }) = _RecommendedListenable;
}

enum RecommendedEffect { error, success, navigation }
