
import 'package:ditonton_dicoding_submission/presentation/bloc/base_top_rated/base_top_rated_bloc.dart';

class BaseTopRatedBlocState<T extends BaseItemEntity> extends Equatable {
  final List<T> topRatedListValue;
  final RequestState topRatedListState;
  final String topRatedListMessageError;

  const BaseTopRatedBlocState({
    this.topRatedListValue = const [],
    this.topRatedListState = RequestState.empty,
    this.topRatedListMessageError = '',
  });

  BaseTopRatedBlocState<T> copyWith({
    List<T>? topRatedListValue,
    RequestState? topRatedListState,
    String? topRatedListMessageError,
  }) {
    return BaseTopRatedBlocState<T>(
      topRatedListValue: topRatedListValue ?? this.topRatedListValue,
      topRatedListState: topRatedListState ?? this.topRatedListState,
      topRatedListMessageError:
          topRatedListMessageError ?? this.topRatedListMessageError,
    );
  }

  @override
  List<Object> get props =>
      [topRatedListValue, topRatedListState, topRatedListMessageError];
}
