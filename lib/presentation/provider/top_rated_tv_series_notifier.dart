import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_top_rated_notifier.dart';

@Deprecated("Use TvSeriesTopRatedBlocCubit instead")
class TopRatedTvSeriesNotifier extends BaseTopRatedNotifier<TvSeries> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesNotifier({required this.getTopRatedTvSeries});

  Future<void> fetchTopRatedTvSeries() async {
    await fetchTopRatedMoviesOrTvSeries(
      result: getTopRatedTvSeries.execute(),
    );
  }
}
