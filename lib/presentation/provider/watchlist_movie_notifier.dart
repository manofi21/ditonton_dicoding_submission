import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/base_watchlist_notifier.dart';

@Deprecated("Use MovieWatchlistBlocCubit instead")
class WatchlistMovieNotifier extends BaseWatchlistNotifier<Movie> {
  WatchlistMovieNotifier({required this.getWatchlistMovies});

  final GetWatchlistMovies getWatchlistMovies;

  Future<void> fetchWatchlistMovies() async {
    await fetchWatchlist(getWatchlistMovies.execute());
  }
}
