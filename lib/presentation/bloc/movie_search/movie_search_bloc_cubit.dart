import 'package:ditonton_dicoding_submission/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc.dart';

import '../base_search/base_search_bloc_cubit.dart';

class MovieSearchBlocCubit extends BaseSearchListBlocCubit<Movie> {
  final SearchMovies searchMovies;

  MovieSearchBlocCubit({required this.searchMovies});

  Future<void> fetchMovieSearch(String query) async {
    await fetchMovieOrTvSeriesSearch(
      searchMovies.execute(query),
    );
  }
}
