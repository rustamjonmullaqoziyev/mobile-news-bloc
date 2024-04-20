import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/article.dart';
import '../../../../domain/repositories/article_repository.dart';

part 'detail_bloc.freezed.dart';

part 'detail_event.dart';

part 'detail_state.dart';

@Injectable()
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  late DetailBuildable _built;
  final ArticleRepository _articleRepository;

  DetailBloc(this._articleRepository) : super(const DetailBuildable()) {
    _built = state as DetailBuildable;
    on<AddFavoriteEvent>(_addFavoriteEvent);
  }

  build(
    Emitter<DetailState> emit,
    DetailBuildable Function(DetailBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }

  _addFavoriteEvent(AddFavoriteEvent event, Emitter<DetailState> emit) async {
    if (event.article.isFavourite) {
      await _articleRepository.removeFavoriteArticle(event.article);
    } else {
      await _articleRepository.addFavoriteArticle(event.article);
    }
  }
}
