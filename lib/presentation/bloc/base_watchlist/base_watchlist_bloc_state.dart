import 'package:ditonton_dicoding_submission/presentation/bloc/base_watchlist/base_watchlist_bloc.dart';

class BaseWatchlistBlocState<T extends BaseItemEntity> extends Equatable {
  final List<T> watchlistListValue;
  final RequestState watchlistListState;
  final String watchlistListMessageError;

  const BaseWatchlistBlocState({
    this.watchlistListValue = const [],
    this.watchlistListState = RequestState.empty,
    this.watchlistListMessageError = '',
  });

  BaseWatchlistBlocState<T> copyWith({
    List<T>? watchlistListValue,
    RequestState? watchlistListState,
    String? watchlistListMessageError,
  }) {
    return BaseWatchlistBlocState<T>(
      watchlistListValue: watchlistListValue ?? this.watchlistListValue,
      watchlistListState: watchlistListState ?? this.watchlistListState,
      watchlistListMessageError:
          watchlistListMessageError ?? this.watchlistListMessageError,
    );
  }

  @override
  List<Object> get props =>
      [watchlistListValue, watchlistListState, watchlistListMessageError];
}
