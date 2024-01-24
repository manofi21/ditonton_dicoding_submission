import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_top_rated/base_top_rated_bloc_cubit.dart';

class TvSeriesTopRatedBlocCubit extends BaseTopRatedListBlocCubit<TvSeries> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TvSeriesTopRatedBlocCubit({required this.getTopRatedTvSeries});

  Future<void> fetchTopRatedTvSeries() async {
    await fetchMovieOrTvSeriesTopRated(
      getTopRatedTvSeries.execute(),
    );
  }
}
