import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_top_rated_notifier.dart';

@Deprecated("Use MovieTopRatedBlocCubit instead")
class TopRatedMoviesNotifier extends BaseTopRatedNotifier<Movie> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMoviesNotifier({required this.getTopRatedMovies});

  Future<void> fetchTopRatedMovies() async {
    await fetchTopRatedMoviesOrTvSeries(
      result: getTopRatedMovies.execute(),
    );
  }
}
