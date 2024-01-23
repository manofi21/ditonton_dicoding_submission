import 'package:ditonton_dicoding_submission/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/save_watchlist_tv_series.dart';

import '../base_detail/base_detail_bloc.dart';

class TvSeriesDetailCubit
    extends BaseDetailBlocCubit<TvSeriesDetail, TvSeries> {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetWatchListTvSeriesStatus getWatchListStatus;
  final SaveWatchlistTvSeries saveWatchlist;
  final RemoveWatchlistTvSeries removeWatchlist;

  TvSeriesDetailCubit(
      {required this.getTvSeriesDetail,
      required this.getTvSeriesRecommendations,
      required this.getWatchListStatus,
      required this.saveWatchlist,
      required this.removeWatchlist});

  Future<void> fetchTvSeriesDetail(int id) async {
    await Future.microtask(() async {
      await fetchMovieOrTvSeriesDetail(
        detailResult: getTvSeriesDetail.execute(id),
        recommendationResult: getTvSeriesRecommendations.execute(id),
      );
      await loadWatchlistStatus(getWatchListStatus.execute(id));
    });
  }

  Future<void> addWatchlistTvSeries(TvSeriesDetail tvSeries) async {
    await addWatchlist(
      saveWatchlist: saveWatchlist.execute(tvSeries),
      loadStatus: getWatchListStatus.execute(tvSeries.id),
    );
  }

  Future<void> removeFromWatchlistTvSeries(TvSeriesDetail tvSeries) async {
    await removeFromWatchlist(
      removeWatchlist: removeWatchlist.execute(tvSeries),
      loadStatus: loadWatchlistStatus(getWatchListStatus.execute(tvSeries.id)),
    );
  }
}
