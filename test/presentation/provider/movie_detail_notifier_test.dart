import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/get_watchlist_movie_status.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_submission/domain/usecases/save_watchlist_movie.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_notifier_test.mocks.dart';

// import '../../dummy_data/dummy_objects.dart';
// import 'movie_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListMovieStatus,
  SaveWatchlistMovie,
  RemoveWatchlistMovie,
])
void main() {
  late MovieDetailNotifier movieDetailNotifier;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListMovieStatus mockGetWatchListMovieStatus;
  late MockSaveWatchlistMovie mockSaveWatchlistMovie;
  late MockRemoveWatchlistMovie mockRemoveWatchlistMovie;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListMovieStatus = MockGetWatchListMovieStatus();
    mockSaveWatchlistMovie = MockSaveWatchlistMovie();
    mockRemoveWatchlistMovie = MockRemoveWatchlistMovie();
    movieDetailNotifier = MovieDetailNotifier(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchListMovieStatus,
      saveWatchlist: mockSaveWatchlistMovie,
      removeWatchlist: mockRemoveWatchlistMovie,
    )..addListener(() {
        listenerCallCount += 1;
      });
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

  void arrangeUsecase() {
    when(mockGetMovieDetail.execute(tId))
        .thenAnswer((_) async => const Right(testMovieDetail));
    when(mockGetMovieRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tMovies));
    when(mockGetWatchListMovieStatus.execute(tId))
        .thenAnswer((_) async => false);
  }

  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      verify(mockGetMovieDetail.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
      verify(mockGetWatchListMovieStatus.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      arrangeUsecase();
      // act
      movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.state, RequestState.loading);
      expect(listenerCallCount, 1);
    });

    test('should change movie when data is gotten successfully', () async {
      // arrange
      arrangeUsecase();
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.state, RequestState.loaded);
      expect(movieDetailNotifier.itemDetail, testMovieDetail);
      expect(listenerCallCount, 4);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.state, RequestState.loaded);
      expect(movieDetailNotifier.recommendations, tMovies);
    });
  });

  group('Get Movie Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUsecase();
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      verify(mockGetMovieRecommendations.execute(tId));
      expect(movieDetailNotifier.recommendations, tMovies);
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      arrangeUsecase();
      // act
      movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.recommendationState, RequestState.loading);
      expect(listenerCallCount, 1);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      arrangeUsecase();
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.recommendationState, RequestState.loaded);
      expect(movieDetailNotifier.recommendations, tMovies);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => const Right(testMovieDetail));
      when(mockGetWatchListMovieStatus.execute(tId))
          .thenAnswer((_) async => false);
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.recommendationState, RequestState.error);
      expect(movieDetailNotifier.recommendationMessage, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchListMovieStatus.execute(1))
          .thenAnswer((_) async => true);
      // act
      await movieDetailNotifier.loadWatchlistStatus(
        mockGetWatchListMovieStatus.execute(1),
      );
      // assert
      expect(movieDetailNotifier.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchListMovieStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await movieDetailNotifier.addWatchlistMovies(testMovieDetail);
      // assert
      verify(mockSaveWatchlistMovie.execute(testMovieDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchListMovieStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await movieDetailNotifier.removeFromWatchlistMovies(testMovieDetail);
      // assert
      verify(mockRemoveWatchlistMovie.execute(testMovieDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetWatchListMovieStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await movieDetailNotifier.addWatchlistMovies(testMovieDetail);
      // assert
      verify(mockGetWatchListMovieStatus.execute(testMovieDetail.id));
      expect(movieDetailNotifier.isAddedToWatchlist, true);
      expect(movieDetailNotifier.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(mockGetWatchListMovieStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await movieDetailNotifier.addWatchlistMovies(testMovieDetail);
      // assert
      expect(movieDetailNotifier.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    when(mockGetWatchListMovieStatus.execute(tId))
        .thenAnswer((_) async => false);
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tMovies));
      // act
      await movieDetailNotifier.fetchMovieDetail(tId);
      // assert
      expect(movieDetailNotifier.state, RequestState.error);
      expect(movieDetailNotifier.message, 'Server Failure');
      expect(listenerCallCount, 3);
    });
  });
}
