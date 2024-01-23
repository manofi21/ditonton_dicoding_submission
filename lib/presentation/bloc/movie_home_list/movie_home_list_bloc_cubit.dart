import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_now_playing_movies.dart';

import '../base_home_list/base_home_list_bloc_cubit.dart';

class HomeMovieListBlocCubit extends BaseHomeListBlocCubit<Movie> {
  final GetNowPlayingMovies getNowPlayingMovies;
  HomeMovieListBlocCubit(this.getNowPlayingMovies);

  Future<void> fetchNowPlayingList() async {
    await getCurrenlyOnAirOrNowPlaying(
      getNowPlayingMovies.execute(),
    );
  }
}
