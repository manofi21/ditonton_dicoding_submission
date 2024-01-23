import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_detail/tv_series_detail_cubit.dart';

import 'package:ditonton_dicoding_submission/presentation/bloc/base_detail/base_detail_bloc.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/detail_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../provider/movie_detail_notifier_test.mocks.dart';
import '../provider/tv_series_detail_notifier_test.mocks.dart';

void main() {
  late MovieDetailCubit movieDetailNotifier;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListMovieStatus mockGetWatchListMovieStatus;
  late MockSaveWatchlistMovie mockSaveWatchlistMovie;
  late MockRemoveWatchlistMovie mockRemoveWatchlistMovie;

  late TvSeriesDetailCubit tvSeriesDetailNotifier;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetWatchListTvSeriesStatus mockGetWatchListTvSeriesStatus;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListMovieStatus = MockGetWatchListMovieStatus();
    mockSaveWatchlistMovie = MockSaveWatchlistMovie();
    mockRemoveWatchlistMovie = MockRemoveWatchlistMovie();
    movieDetailNotifier = MovieDetailCubit(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchListMovieStatus,
      saveWatchlist: mockSaveWatchlistMovie,
      removeWatchlist: mockRemoveWatchlistMovie,
    );

    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockGetWatchListTvSeriesStatus = MockGetWatchListTvSeriesStatus();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    tvSeriesDetailNotifier = TvSeriesDetailCubit(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getTvSeriesRecommendations: mockGetTvSeriesRecommendations,
      getWatchListStatus: mockGetWatchListTvSeriesStatus,
      saveWatchlist: mockSaveWatchlistTvSeries,
      removeWatchlist: mockRemoveWatchlistTvSeries,
    );
  });

  const tId = 1;

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    movieId: 1,
    originalTitle: 'originalTitle',
    movieOverview: 'overview',
    popularity: 1,
    moviePosterPath: 'posterPath',
    releaseDate: 'releaseDate',
    movieTitle: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    tvSeriesId: 1,
    name: "originalTitle",
    tvSeriesOverview: "overview",
    popularity: 1,
    tvSeriesPosterPath: 'posterPath',
    firstAirDate: "firstAirDate",
    originCountry: const ["IT"],
    originalLanguage: "it",
    originalName: "originalName",
    voteAverage: 1,
    voteCount: 1,
  );

  final testTvSeriesList = [tTvSeries];

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailCubit>.value(value: movieDetailNotifier),
        BlocProvider<TvSeriesDetailCubit>.value(value: tvSeriesDetailNotifier)
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  void arrangeUsecaseMovie([bool isWatchlistTrue = false]) {
    when(mockGetMovieDetail.execute(tId))
        .thenAnswer((_) async => const Right(testMovieDetail));
    when(mockGetMovieRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tMovies));
    when(mockGetWatchListMovieStatus.execute(tId))
        .thenAnswer((_) async => isWatchlistTrue);
  }

  void arrangeUsecaseTvSeries([bool isWatchlistTrue = false]) {
    when(mockGetTvSeriesDetail.execute(tId))
        .thenAnswer((_) async => const Right(testTvSeriesDetail));
    when(mockGetTvSeriesRecommendations.execute(tId))
        .thenAnswer((_) async => Right(testTvSeriesList));
    when(mockGetWatchListTvSeriesStatus.execute(tId))
        .thenAnswer((_) async => isWatchlistTrue);
  }

////////////////////////////////////////////////////////

  testWidgets(
    'Watchlist button should display add icon when movie not added to watchlist',
    (tester) async {
      arrangeUsecaseMovie();

      // For executing state value in widget directly.
      // Instead using initstate in widget, where the state after in initState would nothing change
      await movieDetailNotifier.fetchMovieDetail(tId);

      await tester.pumpWidget(
          makeTestableWidget(
            DetailPage(baseItemEntity: tMovie),
          ),
          const Duration(seconds: 10));

      final watchlistButtonIcon = find.byIcon(Icons.add);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    'Watchlist button should display add icon when TV Series not added to watchlist',
    (tester) async {
      arrangeUsecaseTvSeries();

      // For executing state value in widget directly.
      // Instead using initstate in widget, where the state after in initState would nothing change
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);

      await tester.pumpWidget(
          makeTestableWidget(
            DetailPage(baseItemEntity: tTvSeries),
          ),
          const Duration(seconds: 10));

      final watchlistButtonIcon = find.byIcon(Icons.add);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    'Watchlist button should dispay check icon when movie is added to watchlist',
    (tester) async {
      arrangeUsecaseMovie(true);

      // For executing state value in widget directly.
      // Instead using initstate in widget, where the state after in initState would nothing change
      await movieDetailNotifier.fetchMovieDetail(tId);

      await tester.pumpWidget(
          makeTestableWidget(
            DetailPage(baseItemEntity: tMovie),
          ),
          const Duration(seconds: 10));

      final watchlistButtonIcon = find.byIcon(Icons.check);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    'Watchlist button should dispay check icon when TV Series is added to watchlist',
    (tester) async {
      arrangeUsecaseTvSeries(true);

      // For executing state value in widget directly.
      // Instead using initstate in widget, where the state after in initState would nothing change
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);

      await tester.pumpWidget(
          makeTestableWidget(
            DetailPage(baseItemEntity: tTvSeries),
          ),
          const Duration(seconds: 10));

      final watchlistButtonIcon = find.byIcon(Icons.check);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );
}
