import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_watchlist/base_watchlist_bloc_cubit.dart';

class TvSeriesWatchlistBlocCubit extends BaseWatchlistListBlocCubit<TvSeries> {
  TvSeriesWatchlistBlocCubit({required this.getWatchlistTvSeries});

  final GetWatchlistTvSeries getWatchlistTvSeries;

  Future<void> fetchWatchlistTvSeries() async {
    await fetchMovieOrTvSeriesWatchlist(getWatchlistTvSeries.execute());
  }
}