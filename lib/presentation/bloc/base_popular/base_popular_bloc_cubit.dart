
import 'package:ditonton_dicoding_submission/presentation/bloc/base_popular/base_popular_bloc_state.dart';
import 'base_popular_bloc.dart';

typedef MoviePopularListState = BasePopularBlocState<Movie>;

typedef TvSeriesPopularListState = BasePopularBlocState<TvSeries>;

class BasePopularListBlocCubit<T extends BaseItemEntity>
    extends Cubit<BasePopularBlocState<T>> {
  BasePopularListBlocCubit() : super(BasePopularBlocState<T>());

  Future<void> onPopularMovieOrTvSeries(
      Future<Either<Failure, List<T>>> execute) async {
    final onLoadingState = state.copyWith(popularListState: RequestState.loading);
    emit(onLoadingState);

    final result = await execute;
    var newState = result.fold<BasePopularBlocState<T>>(
      (failure) {
        final message = failure.message;
        return onLoadingState.copyWith(
          popularListMessageError: message,
          popularListState: RequestState.error,
        );
      },
      (moviesData) {
        return onLoadingState.copyWith(
          popularListValue: moviesData,
          popularListState: RequestState.loaded,
        );
      },
    );

    emit(newState);
  }
}
