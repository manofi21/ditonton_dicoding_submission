
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc_state.dart';
import 'base_search_bloc.dart';

typedef MovieSearchListState = BaseSearchBlocState<Movie>;

typedef TvSeriesSearchListState = BaseSearchBlocState<TvSeries>;

class BaseSearchListBlocCubit<T extends BaseItemEntity>
    extends Cubit<BaseSearchBlocState<T>> {
  BaseSearchListBlocCubit() : super(BaseSearchBlocState<T>());

  Future<void> fetchMovieOrTvSeriesSearch(
      Future<Either<Failure, List<T>>> execute) async {
    final onLoadingState = state.copyWith(searchListState: RequestState.loading);
    emit(onLoadingState);

    final result = await execute;
    var newState = result.fold<BaseSearchBlocState<T>>(
      (failure) {
        final message = failure.message;
        return onLoadingState.copyWith(
          searchListMessageError: message,
          searchListState: RequestState.error,
        );
      },
      (moviesData) {
        return onLoadingState.copyWith(
          searchListValue: moviesData,
          searchListState: RequestState.loaded,
        );
      },
    );

    emit(newState);
  }
}
