import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_on_air_tv_series.dart';

import '../base_home_list/base_home_list_bloc_cubit.dart';

class HomeTvSeriesListBlocCubit extends BaseHomeListBlocCubit<TvSeries> {
  final GetOnAirTvSeries getOnAirTvSeries;
  HomeTvSeriesListBlocCubit(this.getOnAirTvSeries);

  Future<void> fetchOnAirTvSeries() async {
    await getCurrenlyOnAirOrNowPlaying(
      getOnAirTvSeries.execute(),
    );
  }
}
