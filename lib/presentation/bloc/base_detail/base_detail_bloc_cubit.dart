import 'package:bloc/bloc.dart';
import 'base_detail_bloc.dart';

typedef MovieDetailState = BaseDetailBlocState<MovieDetail, Movie>;

typedef TvSeriesDetailState = BaseDetailBlocState<TvSeriesDetail, TvSeries>;

abstract class BaseDetailBlocCubit<T extends BaseItemDetail,
    Y extends BaseItemEntity> extends Cubit<BaseDetailBlocState<T, Y>> {
  BaseDetailBlocCubit() : super(BaseDetailBlocState<T, Y>());

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  Future<void> fetchMovieOrTvSeriesDetail({
    required Future<Either<Failure, T>> detailResult,
    required Future<Either<Failure, List<Y>>> recommendationResult,
  }) async {
    var stateLoading = BaseDetailBlocState<T, Y>.loadingState();
    emit(stateLoading);

    late BaseDetailBlocState<T, Y> updatedState;

    final loadGettedData = await Future.wait([
      detailResult,
      recommendationResult,
    ]);

    final varDetailResult = loadGettedData[0] as Either<Failure, T>;
    final varRecommendationResult = loadGettedData[1] as Either<Failure, List<Y>>;



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
        currentState = currentState.copyWith(
          addedToWatchlistMessage: failure.message,
        );
      },
      (successMessage) async {
        currentState = currentState.copyWith(
          addedToWatchlistMessage: successMessage,
        );
      },
    );

    emit(currentState);

    await loadStatus;
  }

  Future<void> addWatchlist(
      {required Future<Either<Failure, String>> saveWatchlist,
      required Future<bool> loadStatus}) async {
    var currentState = state.copyWith(isAddToWatchlistLoading: true);

    final result = await saveWatchlist;
    emit(currentState);

    String getMessage = result.fold<String>(
      (failure) {
        return failure.message;
      },
      (successMessage) {
        return successMessage;
      },
    );

    currentState = state.copyWith(
      addedToWatchlistMessage: getMessage,
    );
    emit(currentState);

    final getStatus = await loadStatus;
    currentState = currentState.copyWith(isAddedToWatchlist: getStatus);
    emit(currentState);
  }

  Future<void> loadWatchlistStatus(Future<bool> getWatchListStatus) async {
    final getStatus = await getWatchListStatus;
    var currentState = state;
    currentState = currentState.copyWith(isAddedToWatchlist: getStatus);
    emit(currentState);
  }
}
