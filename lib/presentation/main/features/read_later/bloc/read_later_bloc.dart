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
      build((buildable) => buildable.copyWith(
          readLaterArticles: readLaterArticles,
          readLaterArticlesState: LoadingState.loaded));
    } catch (e) {
      build((buildable) =>
          buildable.copyWith(readLaterArticlesState: LoadingState.error));
    }
  }

  _getReadLaterArticleEvent(
      GetReadLaterArticleEvent event, Emitter<ReadLaterState> emit) async {
    await getReadLaterArticle();
  }
}
