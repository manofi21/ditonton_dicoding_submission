import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_tv_series.dart';

import '../base_popular/base_popular_bloc.dart';
import '../base_popular/base_popular_bloc_cubit.dart';

class TvSeriesPopularBlocCubit extends BasePopularListBlocCubit<TvSeries> {
  final GetPopularTvSeries getPopularTvSeries;

  TvSeriesPopularBlocCubit({required this.getPopularTvSeries});

  Future<void> fetchTvSeriesPopular() async {
    await onPopularMovieOrTvSeries(
      getPopularTvSeries.execute(),
    );
  }
}
