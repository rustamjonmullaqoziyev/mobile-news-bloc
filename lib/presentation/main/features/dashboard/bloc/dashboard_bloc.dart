import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../domain/modules/article.dart';
import '../../../../../domain/repositories/article_repository.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

part 'dashboard_bloc.freezed.dart';

@Injectable()
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  late DashboardBuildable _built;
  final ArticleRepository _articleRepository;

  DashboardBloc(this._articleRepository) : super(const DashboardBuildable()) {
    _built = state as DashboardBuildable;
    getBreakingArticle();
    getTopStoreArticle();
  }

  build(
    DashboardBuildable Function(DashboardBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }

  Future<void> getBreakingArticle() async {
    try {
      final breakingArticles = await _articleRepository.getBreakingArticle();
      build((buildable) => buildable.copyWith(
          breakingArticles: breakingArticles,
          breakingArticlesState: LoadingState.loaded));
    } catch (e) {
      build((buildable) =>
          buildable.copyWith(breakingArticlesState: LoadingState.error));
    }
  }

  Future<void> getTopStoreArticle() async {
    try {
      final breakingArticles = await _articleRepository.getTopStoreArticle();
      build((buildable) => buildable.copyWith(
          topStoreArticles: breakingArticles,
          topStoreArticlesState: LoadingState.loaded));
    } catch (e) {
      build((buildable) =>
          buildable.copyWith(topStoreArticlesState: LoadingState.error));
    }
  }
}
