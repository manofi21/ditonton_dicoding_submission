import 'package:ditonton_dicoding_submission/presentation/bloc/base_detail/base_detail_bloc.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_home_list/base_home_list_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef MovieHomeListState = BaseHomeListBlocState<Movie>;

typedef TvSeriesHomeListState = BaseHomeListBlocState<TvSeries>;

class BaseHomeListBlocCubit<T extends BaseItemEntity>
    extends Cubit<BaseHomeListBlocState<T>> {
  BaseHomeListBlocCubit() : super(BaseHomeListBlocState<T>());

  Future<void> getCurrenlyOnAirOrNowPlaying(
      Future<Either<Failure, List<T>>> execute) async {
    final onLoadingState = state.copyWith(homeListState: RequestState.loading);
    emit(onLoadingState);

    final result = await execute;
    var newState = result.fold<BaseHomeListBlocState<T>>(
      (failure) {
        final message = failure.message;
        return onLoadingState.copyWith(
          homeListMessageError: message,
          homeListState: RequestState.error,
        );
      },
      (moviesData) {
        return onLoadingState.copyWith(
          homeListValue: moviesData,
          homeListState: RequestState.loaded,
        );
      },
    );

    emit(newState);
  }
}
