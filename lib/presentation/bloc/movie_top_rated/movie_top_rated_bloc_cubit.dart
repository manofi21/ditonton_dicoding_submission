import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_top_rated/base_top_rated_bloc_cubit.dart';

class MovieTopRatedBlocCubit extends BaseTopRatedListBlocCubit<Movie> {
  final GetTopRatedMovies getTopRatedMovie;

  MovieTopRatedBlocCubit({required this.getTopRatedMovie});

  Future<void> fetchTopRatedMovie() async {
    await fetchMovieOrTvSeriesTopRated(
      getTopRatedMovie.execute(),
    );
  }
}
