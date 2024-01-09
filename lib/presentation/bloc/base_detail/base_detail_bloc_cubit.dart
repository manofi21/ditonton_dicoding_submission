import 'package:bloc/bloc.dart';
import 'base_detail_bloc.dart';


typedef MovieDetailState = BaseDetailBlocState<MovieDetail, Movie>?;

typedef TvSeriesDetailState = BaseDetailBlocState<TvSeriesDetail, TvSeries>?;

abstract class BaseDetailBlocCubit<T extends BaseItemDetail, Y extends BaseItemEntity>
    extends Cubit<BaseDetailBlocState<T, Y>?> {
  BaseDetailBlocCubit() : super(null);

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  Future<void> fetchMovieOrTvSeriesDetail({
    required Future<Either<Failure, T>> detailResult,
    required Future<Either<Failure, List<Y>>> recommendationResult,
  }) async {
    var stateLoading = BaseDetailBlocState<T, Y>.loadingState();
    emit(stateLoading);

    late BaseDetailBlocState<T, Y> updatedState;
    final varDetailResult = await detailResult;
    final varRecommendationResult = await recommendationResult;

    varDetailResult.fold(
      (failure) {
        updatedState = BaseDetailBlocState<T, Y>.errorState(
          failure.message,
        );
      },
      (baseItem) {
        updatedState = BaseDetailBlocState<T, Y>.loadedState(
          baseItem,
        );
      },
    );

    varRecommendationResult.fold(
      (failure) {
        updatedState = updatedState.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: failure.message,
        );
      },
      (recpmmendations) {
        updatedState = updatedState.copyWith(
          recommendationState: RequestState.loaded,
          recommendations: recpmmendations,
        );
      },
    );

    emit(updatedState);
  }

  Future<void> removeFromWatchlist({
    required Future<Either<Failure, String>> removeWatchlist,
    required Future<void> loadStatus,
  }) async {
    final result = await removeWatchlist;
    var currentState = state;

    await result.fold(
      (failure) async {
        currentState = currentState?.copyWith(
          addedToWatchlistMessage: failure.message,
        );
      },
      (successMessage) async {
        currentState = currentState?.copyWith(
          addedToWatchlistMessage: successMessage,
        );
      },
    );

    emit(currentState);

    await loadStatus;
  }

  Future<void> addWatchlist(
      {required Future<Either<Failure, String>> saveWatchlist,
      required Future<void> loadStatus}) async {
    final result = await saveWatchlist;
    var currentState = state;

    await result.fold(
      (failure) async {
        currentState = currentState?.copyWith(
          addedToWatchlistMessage: failure.message,
        );
      },
      (successMessage) async {
        currentState = currentState?.copyWith(
          addedToWatchlistMessage: successMessage,
        );
      },
    );

    emit(currentState);

    await loadStatus;
  }

  Future<void> loadWatchlistStatus(Future<bool> getWatchListStatus) async {
    final getStatus = await getWatchListStatus;
    var currentState = state;
    emit(currentState);

    currentState = currentState?.copyWith(
      isAddedToWatchlist: getStatus
    );
    emit(currentState);
    
  }
}
