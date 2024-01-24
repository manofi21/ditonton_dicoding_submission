import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/search_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_search_notifier.dart';

@Deprecated("Use TvSeriesSearchBlocCubit instead")
class TvSeriesSearchNotifier extends BaseSearchNotifier<TvSeries> {
  final SearchTvSeries searchTvSeries;

  TvSeriesSearchNotifier({required this.searchTvSeries});

  Future<void> fetchTvSeriesSearch(String query) async {
    await fetchMovieOrTvSeriesSearch(
      searchTvSeries.execute(query),
    );
  }
}
