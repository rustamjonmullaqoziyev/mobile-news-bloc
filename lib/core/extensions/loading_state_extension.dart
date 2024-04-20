import 'package:mobile_news_with_bloc/core/utils/utils.dart';

extension LoadingStateExtension on LoadingState {
  bool get isLoading => this == LoadingState.loading;

  bool get isLoaded => this == LoadingState.loaded;

  bool get isError => this == LoadingState.error;

  bool get isEmpty => this == LoadingState.empty;
}
