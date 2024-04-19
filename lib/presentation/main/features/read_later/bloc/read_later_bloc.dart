import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../domain/modules/article.dart';
import '../../../../../domain/repositories/article_repository.dart';

part 'read_later_bloc.freezed.dart';

part 'read_later_event.dart';

part 'read_later_state.dart';

@Injectable()
class ReadLaterBloc extends Bloc<ReadLaterEvent, ReadLaterState> {
  late ReadLaterBuildable _built;
  final ArticleRepository _articleRepository;

  ReadLaterBloc(this._articleRepository) : super(const ReadLaterBuildable()) {
    _built = state as ReadLaterBuildable;
    on<GetReadLaterArticleEvent>(_getReadLaterArticleEvent);
    on<RemoveFavoriteEvent>(_removeFavoriteEvent);
    getReadLaterArticle();
  }

  build(
    ReadLaterBuildable Function(ReadLaterBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }

  Future<void> getReadLaterArticle() async {
    try {
      final readLaterArticles = await _articleRepository.getReadLaterArticle();
      if (readLaterArticles.isNotEmpty) {
        build((buildable) =>
            buildable.copyWith(readLaterArticles: readLaterArticles, readLaterArticlesState: LoadingState.loaded));
      } else {
        build((buildable) => buildable.copyWith(readLaterArticlesState: LoadingState.empty));
      }
    } catch (e) {
      build((buildable) => buildable.copyWith(readLaterArticlesState: LoadingState.error));
    }
  }

  _getReadLaterArticleEvent(GetReadLaterArticleEvent event, Emitter<ReadLaterState> emit) async {
    await getReadLaterArticle();
  }

  _removeFavoriteEvent(RemoveFavoriteEvent event, Emitter<ReadLaterState> emit) async {
    try {
      await _articleRepository.removeFavoriteArticle(event.article);
      List<Article> list = <Article>[];
      for (var element in _built.readLaterArticles) {
        if (element.id != event.article.id) list.add(element);
      }
      build((buildable) => buildable.copyWith(
          readLaterArticles: list, readLaterArticlesState: list.isEmpty ? LoadingState.empty : LoadingState.loaded));
    } catch (e) {
      build((buildable) => buildable.copyWith(readLaterArticlesState: LoadingState.error));
    }
  }
}
