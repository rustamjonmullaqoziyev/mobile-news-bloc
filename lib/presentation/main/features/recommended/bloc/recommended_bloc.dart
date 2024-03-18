import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'recommended_event.dart';
part 'recommended_state.dart';
part 'recommended_bloc.freezed.dart';

@Injectable()
class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  late RecommendedBuildable _built;

  RecommendedBloc() : super(const RecommendedBuildable()) {
    _built = state as RecommendedBuildable;
  }

  build(
      Emitter<RecommendedState> emit,
      RecommendedBuildable Function(RecommendedBuildable buildable) builder,
      ) {
    _built = builder(_built);
    emit(_built);
  }
}
