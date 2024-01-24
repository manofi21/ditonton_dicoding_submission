import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_popular_notifier.dart';

@Deprecated("Use TvSeriePopularBlocCubit instead")
class PopularTvSeriesNotifier extends BasePopularNotifier<TvSeries> {
  final GetPopularTvSeries getPopularTvSeries;

  PopularTvSeriesNotifier(this.getPopularTvSeries);

  Future<void> fetchPopularTvSeries() async {
    await onPopularMovieOrTvSeries(
      result: getPopularTvSeries.execute(),
    );
  }
}
