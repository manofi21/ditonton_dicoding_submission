import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movie_status.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/save_watchlist_movie.dart';

import '../base_detail/base_detail_bloc.dart';

class MovieDetailCubit extends BaseDetailBlocCubit<MovieDetail, Movie> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListMovieStatus getWatchListStatus;
  final SaveWatchlistMovie saveWatchlist;
  final RemoveWatchlistMovie removeWatchlist;

  MovieDetailCubit(
      {required this.getMovieDetail,
      required this.getMovieRecommendations,
      required this.getWatchListStatus,
      required this.saveWatchlist,
      required this.removeWatchlist});

  Future<void> fetchMovieDetail(int id) async {
    await Future.microtask(() async {
      await fetchMovieOrTvSeriesDetail(
        detailResult: getMovieDetail.execute(id),
        recommendationResult: getMovieRecommendations.execute(id),
      );
      await loadWatchlistStatus(getWatchListStatus.execute(id));
    });
  }

  Future<void> addWatchlistMovies(MovieDetail movie) async {
    await addWatchlist(
      saveWatchlist:  saveWatchlist.execute(movie),
      loadStatus: getWatchListStatus.execute(movie.id),
    );
  }

  Future<void> removeFromWatchlistMovies(MovieDetail movie) async {
    await removeFromWatchlist(
      removeWatchlist: removeWatchlist.execute(movie),
      loadStatus: loadWatchlistStatus(getWatchListStatus.execute(movie.id)),
    );
  }
}
