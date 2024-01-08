import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_on_air_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_list_notifier.dart';

class TvSeriesListNotifier extends HomeListNotifier<TvSeries> {
  TvSeriesListNotifier({
    required this.getOnAirTvSeries,
    required this.getPopularTvSeries,
    required this.getTopRatedTvSeries,
  });

  final GetOnAirTvSeries getOnAirTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  Future<void> fetchNowPlayingTvSeries() async {
    await onPlayingMovieOrTvSeries(
      result: getOnAirTvSeries.execute(),
    );

    // nowPlayingState;
    // nowPlayingTs;
  }

  Future<void> fetchPopularTvSeries() async {
    await onPopularMovieOrTvSeries(
      result: getPopularTvSeries.execute(),
    );

    // popularTsState
    // popularTs
  }

  Future<void> fetchTopRatedTvSeries() async {
    await onTopRatedMovieOrTvSeries(
      result: getTopRatedTvSeries.execute(),
    );
  }
}
