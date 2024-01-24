import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_search_notifier.dart';

@Deprecated("Use MovieSearchBlocCubit instead")
class MovieSearchNotifier extends BaseSearchNotifier<Movie> {
  final SearchMovies searchMovies;

  MovieSearchNotifier({required this.searchMovies});

  Future<void> fetchMovieSearch(String query) async {
    await fetchMovieOrTvSeriesSearch(
      searchMovies.execute(query),
    );
  }
}
