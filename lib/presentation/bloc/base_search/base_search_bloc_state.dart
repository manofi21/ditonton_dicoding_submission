import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc.dart';

class BaseSearchBlocState<T extends BaseItemEntity> extends Equatable {
  final List<T> searchListValue;
  final RequestState searchListState;
  final String searchListMessageError;

  const BaseSearchBlocState({
    this.searchListValue = const [],
    this.searchListState = RequestState.empty,
    this.searchListMessageError = '',
  });

  BaseSearchBlocState<T> copyWith({
    List<T>? searchListValue,
    RequestState? searchListState,
    String? searchListMessageError,
  }) {
    return BaseSearchBlocState<T>(
      searchListValue: searchListValue ?? this.searchListValue,
      searchListState: searchListState ?? this.searchListState,
      searchListMessageError:
          searchListMessageError ?? this.searchListMessageError,
    );
  }

  @override
  List<Object> get props =>
      [searchListValue, searchListState, searchListMessageError];
}
