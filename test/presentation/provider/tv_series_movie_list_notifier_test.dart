import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_tv_series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_list_notifier_test.mocks.dart';

void main() {
  late MockGetOnAirTvSeries mockGetNowPlayingMovies;
  late HomeTvSeriesListNotifier notifier;
  late int listenerCallCount;


  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingMovies = MockGetOnAirTvSeries();
    notifier = HomeTvSeriesListNotifier(mockGetNowPlayingMovies)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1],
    tvSeriesId: 1,
    originalName: 'originalTitle',
    tvSeriesOverview: 'overview',
    popularity: 1,
    tvSeriesPosterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    originCountry: const ["US"],
    originalLanguage: "en",
    name: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvSeriesList = <TvSeries>[tTvSeries];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetNowPlayingMovies.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    notifier.fetchOnAirTvSeries();
    // assert
    expect(notifier.homelistState, RequestState.loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetNowPlayingMovies.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    await notifier.fetchOnAirTvSeries();
    // assert
    expect(notifier.homelistState, RequestState.loaded);
    expect(notifier.homeList, tTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetNowPlayingMovies.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchOnAirTvSeries();
    // assert
    expect(notifier.homelistState, RequestState.error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}