import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/domain/modules/article.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../domain/repositories/article_repository.dart';

part 'recommended_bloc.freezed.dart';

part 'recommended_event.dart';

part 'recommended_state.dart';

@Injectable()
class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  late RecommendedBuildable _built;
  final ArticleRepository _articleRepository;

  RecommendedBloc(this._articleRepository)
      : super(const RecommendedBuildable()) {
    _built = state as RecommendedBuildable;
    on<GetRecommendedArticlesEvent>(_getRecommendedArticleEvent);
    on<AddFavoriteEvent>(_addFavoriteEvent);
    getRecommendedArticle();
  }

  build(
    RecommendedBuildable Function(RecommendedBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }

  Future<void> getRecommendedArticle() async {
    try {
      final recommendedArticles =
          await _articleRepository.getRecommendedArticle();
      if (recommendedArticles.isNotEmpty) {
        build((buildable) => buildable.copyWith(
            recommendedArticles: recommendedArticles,
            recommendedArticlesState: LoadingState.loaded));
      } else {
        build((buildable) =>
            buildable.copyWith(recommendedArticlesState: LoadingState.empty));
      }
    } catch (e) {
      build((buildable) =>
          buildable.copyWith(recommendedArticlesState: LoadingState.error));
    }
  }

  _getRecommendedArticleEvent(
      GetRecommendedArticlesEvent event, Emitter<RecommendedState> emit) async {
    await getRecommendedArticle();
  }

  _addFavoriteEvent(
      AddFavoriteEvent event, Emitter<RecommendedState> emit) async {
    if (event.article.isFavourite) {
      await _articleRepository.removeFavoriteArticle(event.article);
    } else {
      await _articleRepository.addFavoriteArticle(event.article);
    }
  }
}
