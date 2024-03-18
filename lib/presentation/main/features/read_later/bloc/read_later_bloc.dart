import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'read_later_event.dart';

part 'read_later_state.dart';

part 'read_later_bloc.freezed.dart';

@Injectable()
class ReadLaterBloc extends Bloc<ReadLaterEvent, ReadLaterState> {
  late ReadLaterBuildable _built;

  ReadLaterBloc() : super(const ReadLaterBuildable()) {
    _built = state as ReadLaterBuildable;
  }

  build(
    Emitter<ReadLaterState> emit,
    ReadLaterBuildable Function(ReadLaterBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }
}
