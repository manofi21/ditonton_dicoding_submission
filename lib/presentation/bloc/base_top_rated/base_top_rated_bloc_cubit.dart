
import 'package:ditonton_dicoding_submission/presentation/bloc/base_top_rated/base_top_rated_bloc_state.dart';
import 'base_top_rated_bloc.dart';

typedef MovieTopRatedListState = BaseTopRatedBlocState<Movie>;

typedef TvSeriesTopRatedListState = BaseTopRatedBlocState<TvSeries>;

class BaseTopRatedListBlocCubit<T extends BaseItemEntity>
    extends Cubit<BaseTopRatedBlocState<T>> {
  BaseTopRatedListBlocCubit() : super(BaseTopRatedBlocState<T>());

  Future<void> fetchMovieOrTvSeriesTopRated(
      Future<Either<Failure, List<T>>> execute) async {
    final onLoadingState = state.copyWith(topRatedListState: RequestState.loading);
    emit(onLoadingState);

    final result = await execute;
    var newState = result.fold<BaseTopRatedBlocState<T>>(
      (failure) {
        final message = failure.message;
        return onLoadingState.copyWith(
          topRatedListMessageError: message,
          topRatedListState: RequestState.error,
        );
      },
      (moviesData) {
        return onLoadingState.copyWith(
          topRatedListValue: moviesData,
          topRatedListState: RequestState.loaded,
        );
      },
    );

    emit(newState);
  }
}
