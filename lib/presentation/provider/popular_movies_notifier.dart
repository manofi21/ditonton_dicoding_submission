import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_popular_notifier.dart';

class PopularMoviesNotifier extends BasePopularNotifier<Movie> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesNotifier(this.getPopularMovies);

  Future<void> fetchPopularMovies() async {
    await onPopularMovieOrTvSeries(
      result: getPopularMovies.execute(),
    );
  }
}
