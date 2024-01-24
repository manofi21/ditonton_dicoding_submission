
import 'package:ditonton_dicoding_submission/presentation/bloc/base_watchlist/base_watchlist_bloc_state.dart';
import 'base_watchlist_bloc.dart';

typedef MovieWatchlistListState = BaseWatchlistBlocState<Movie>;

typedef TvSeriesWatchlistListState = BaseWatchlistBlocState<TvSeries>;

class BaseWatchlistListBlocCubit<T extends BaseItemEntity>
    extends Cubit<BaseWatchlistBlocState<T>> {
  BaseWatchlistListBlocCubit() : super(BaseWatchlistBlocState<T>());

  Future<void> fetchMovieOrTvSeriesWatchlist(
      Future<Either<Failure, List<T>>> execute) async {
    final onLoadingState = state.copyWith(watchlistListState: RequestState.loading);
    emit(onLoadingState);

    final result = await execute;
    var newState = result.fold<BaseWatchlistBlocState<T>>(
      (failure) {
        final message = failure.message;
        return onLoadingState.copyWith(
          watchlistListMessageError: message,
          watchlistListState: RequestState.error,
        );
      },
      (moviesData) {
        return onLoadingState.copyWith(
          watchlistListValue: moviesData,
          watchlistListState: RequestState.loaded,
        );
      },
    );

    emit(newState);
  }
}
