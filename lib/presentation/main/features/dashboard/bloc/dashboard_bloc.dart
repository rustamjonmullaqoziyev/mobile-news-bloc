import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

part 'dashboard_bloc.freezed.dart';

@Injectable()
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  late DashboardBuildable _built;

  DashboardBloc() : super(const DashboardBuildable()) {
    _built = state as DashboardBuildable;
  }

  build(
    Emitter<DashboardState> emit,
    DashboardBuildable Function(DashboardBuildable buildable) builder,
  ) {
    _built = builder(_built);
    emit(_built);
  }
}
