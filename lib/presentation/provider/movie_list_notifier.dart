import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_list_notifier.dart';

class MovieListNotifier extends HomeListNotifier<Movie> {
  MovieListNotifier({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
  });

  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  Future<void> fetchNowPlayingMovies() async {
    await onPlayingMovieOrTvSeries(
      result: getNowPlayingMovies.execute(),
    );

  }

  Future<void> fetchPopularMovies() async {
    await onPopularMovieOrTvSeries(
      result: getPopularMovies.execute(),
    );

  }

  Future<void> fetchTopRatedMovies() async {
    await onTopRatedMovieOrTvSeries(
      result: getTopRatedMovies.execute(),
    );
  }
}
