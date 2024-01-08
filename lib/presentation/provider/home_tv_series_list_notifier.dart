import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_on_air_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_home_list_notifier.dart';

class HomeTvSeriesListNotifier extends BaseHomeListNotifier<TvSeries> {
  final GetOnAirTvSeries getOnAirTvSeries;
  HomeTvSeriesListNotifier(this.getOnAirTvSeries);

  Future<void> fetchOnAirTvSeries() async {
    await getCurrenlyOnAirOrNowPlaying(
      getOnAirTvSeries.execute(),
    );
  }
}
