import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_movies.dart';

import '../base_popular/base_popular_bloc.dart';
import '../base_popular/base_popular_bloc_cubit.dart';

class MoviePopularBlocCubit extends BasePopularListBlocCubit<Movie> {
  final GetPopularMovies getPopularMovies;

  MoviePopularBlocCubit({required this.getPopularMovies});

  Future<void> fetchMoviePopular() async {
    await onPopularMovieOrTvSeries(
      getPopularMovies.execute(),
    );
  }
}
