import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  late MainBuildable _built;

  MainBloc() : super(const MainBuildable()) {
    _built = state as MainBuildable;
  }

  build(
    Emitter<MainState> emit,
    MainBuildable Function(MainBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }
}
