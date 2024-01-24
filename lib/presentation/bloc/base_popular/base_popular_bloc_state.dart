import 'package:ditonton_dicoding_submission/presentation/bloc/base_popular/base_popular_bloc.dart';

class BasePopularBlocState<T extends BaseItemEntity> extends Equatable {
  final List<T> popularListValue;
  final RequestState popularListState;
  final String popularListMessageError;

  const BasePopularBlocState({
    this.popularListValue = const [],
    this.popularListState = RequestState.empty,
    this.popularListMessageError = '',
  });

  BasePopularBlocState<T> copyWith({
    List<T>? popularListValue,
    RequestState? popularListState,
    String? popularListMessageError,
  }) {
    return BasePopularBlocState<T>(
      popularListValue: popularListValue ?? this.popularListValue,
      popularListState: popularListState ?? this.popularListState,
      popularListMessageError:
          popularListMessageError ?? this.popularListMessageError,
    );
  }

  @override
  List<Object> get props =>
      [popularListValue, popularListState, popularListMessageError];
}
