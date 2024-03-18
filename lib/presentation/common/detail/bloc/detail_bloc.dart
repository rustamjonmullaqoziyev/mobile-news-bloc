import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'detail_event.dart';

part 'detail_state.dart';

part 'detail_bloc.freezed.dart';

@Injectable()
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  late DetailBuildable _built;

  DetailBloc() : super(const DetailBuildable()) {
    _built = state as DetailBuildable;
  }

  build(
    Emitter<DetailState> emit,
    DetailBuildable Function(DetailBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }
}
