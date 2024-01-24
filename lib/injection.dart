import 'package:ditonton_dicoding_submission/data/datasources/db/database_helper.dart';
import 'package:ditonton_dicoding_submission/data/datasources/movie_local_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton_dicoding_submission/data/repositories/movie_repository_impl.dart';
import 'package:ditonton_dicoding_submission/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/tv_series_repository.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_on_air_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movie_status.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/save_watchlist_movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/search_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_home_list/movie_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_popular/movie_popular_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_search/movie_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_top_rated/movie_top_rated_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_watchlist/movie_watchlist_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_detail/tv_series_detail_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_home_list/tv_series_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_popular/tv_series_popular_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_search/tv_series_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_top_rated/tv_series_top_rated_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_watchlist/tv_series_watchlist_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_movie_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_tv_series_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_tv_series_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesListNotifier(
      getOnAirTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieDetailCubit(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  
  locator.registerFactory(
    () => TvSeriesDetailCubit(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesSearchNotifier(
      searchTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchBlocCubit(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesSearchBlocCubit(
      searchTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvSeriesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MoviePopularBlocCubit(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesPopularBlocCubit(
      getPopularTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvSeriesNotifier(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieTopRatedBlocCubit(
      getTopRatedMovie: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesTopRatedBlocCubit(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvSeriesNotifier(
      getWatchlistTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieWatchlistBlocCubit(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesWatchlistBlocCubit(
      getWatchlistTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => HomeMovieListNotifier(locator()),
  );
  locator.registerFactory(
    () => HomeTvSeriesListNotifier(locator()),
  );
    locator.registerFactory(
    () => HomeMovieListBlocCubit(locator()),
  );
  locator.registerFactory(
    () => HomeTvSeriesListBlocCubit(locator()),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListMovieStatus(locator()));
  locator.registerLazySingleton(() => GetWatchListTvSeriesStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetOnAirTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      localDataSource: locator(),
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
