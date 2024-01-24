import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_watchlist/base_watchlist_bloc_cubit.dart';

class MovieWatchlistBlocCubit extends BaseWatchlistListBlocCubit<Movie> {
  MovieWatchlistBlocCubit({required this.getWatchlistMovies});

  final GetWatchlistMovies getWatchlistMovies;

  Future<void> fetchWatchlistMovies() async {
    await fetchMovieOrTvSeriesWatchlist(getWatchlistMovies.execute());
  }
}
