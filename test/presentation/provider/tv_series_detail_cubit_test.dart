import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_detail/tv_series_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_notifier_test.mocks.dart';

// import '../../dummy_data/dummy_objects.dart';
// import 'TvSeries_detail_notifier_test.mocks.dart';

void main() {
  late TvSeriesDetailCubit tvSeriesDetailNotifier;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetWatchListTvSeriesStatus mockGetWatchListTvSeriesStatus;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
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
  final tTvSeriess = <TvSeries>[tTvSeries];

  void arrangeUsecase() {
    when(mockGetTvSeriesDetail.execute(tId))
        .thenAnswer((_) async => const Right(testTvSeriesDetail));
    when(mockGetTvSeriesRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tTvSeriess));
    when(mockGetWatchListTvSeriesStatus.execute(tId))
        .thenAnswer((_) async => false);
  }

  group('Get TvSeries Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      verify(mockGetTvSeriesDetail.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
      verify(mockGetWatchListTvSeriesStatus.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      arrangeUsecase();
      // act
      tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.baseItemState, RequestState.loading);
    });

    test('should change TvSeries when data is gotten successfully', () async {
      // arrange
      arrangeUsecase();
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.baseItemState, RequestState.loaded);
      expect(tvSeriesDetailNotifier.state.baseItemDetail, testTvSeriesDetail);
    });

    test(
        'should change recommendation TvSeriess when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.baseItemState, RequestState.loaded);
      expect(tvSeriesDetailNotifier.state.recommendations, tTvSeriess);
    });
  });

  group('Get TvSeries Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      verify(mockGetTvSeriesRecommendations.execute(tId));
      expect(tvSeriesDetailNotifier.state.recommendations, tTvSeriess);
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      arrangeUsecase();
      // act
      tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.recommendationState, RequestState.loading);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.recommendationState, RequestState.loaded);
      expect(tvSeriesDetailNotifier.state.recommendations, tTvSeriess);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => const Right(testTvSeriesDetail));
      when(mockGetWatchListTvSeriesStatus.execute(tId))
          .thenAnswer((_) async => false);
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.recommendationState, RequestState.error);
      expect(tvSeriesDetailNotifier.state.recommendationMessage, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchListTvSeriesStatus.execute(1))
          .thenAnswer((_) async => true);
      // act
      await tvSeriesDetailNotifier.loadWatchlistStatus(
        mockGetWatchListTvSeriesStatus.execute(1),
      );
      // assert
      expect(tvSeriesDetailNotifier.state.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchListTvSeriesStatus.execute(testTvSeriesDetail.id))
          .thenAnswer((_) async => true);
      // act
      await tvSeriesDetailNotifier.addWatchlistTvSeries(testTvSeriesDetail);
      // assert
      verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchListTvSeriesStatus.execute(testTvSeriesDetail.id))
          .thenAnswer((_) async => false);
      // act
      await tvSeriesDetailNotifier
          .removeFromWatchlistTvSeries(testTvSeriesDetail);
      // assert
      verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetWatchListTvSeriesStatus.execute(testTvSeriesDetail.id))
          .thenAnswer((_) async => true);
      // act
      await tvSeriesDetailNotifier.addWatchlistTvSeries(testTvSeriesDetail);
      // assert
      verify(mockGetWatchListTvSeriesStatus.execute(testTvSeriesDetail.id));
      expect(tvSeriesDetailNotifier.state.isAddedToWatchlist, true);
      expect(tvSeriesDetailNotifier.state.addedToWatchlistMessage, 'Added to Watchlist');
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(mockGetWatchListTvSeriesStatus.execute(testTvSeriesDetail.id))
          .thenAnswer((_) async => false);
      // act
      await tvSeriesDetailNotifier.addWatchlistTvSeries(testTvSeriesDetail);
      // assert
      expect(tvSeriesDetailNotifier.state.addedToWatchlistMessage, 'Failed');
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetWatchListTvSeriesStatus.execute(tId))
          .thenAnswer((_) async => false);
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tTvSeriess));
      // act
      await tvSeriesDetailNotifier.fetchTvSeriesDetail(tId);
      // assert
      expect(tvSeriesDetailNotifier.state.baseItemState, RequestState.error);
      expect(tvSeriesDetailNotifier.state.baseItemMessage, 'Server Failure');
    });
  });
}
