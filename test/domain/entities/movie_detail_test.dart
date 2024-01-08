import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('MovieDetail', () {
    test('should be a equal to other MovieDetail', () async {
      const detail1 = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );

      expect(true, testMovieDetail == detail1);
    });

    test('should be a not equal because different adult', () async {
      const testDetail = MovieDetail(
        adult: true,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different backdropPath', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath_',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different list genders', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different id', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 2,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different originalTitle', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 2,
        originalTitle: 'originalTitles',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different overview', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitles',
        movieOverview: 'overviewer',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different posterPath', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'poster_path',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different releaseDate', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'release_date',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different runtime', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 125,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different title', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title_1',
        movieVoteAverage: 1,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different voteAverage', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 0,
        voteCount: 1,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a not equal because different voteCount', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 0,
      );
      expect(true, testMovieDetail != testDetail);
    });

    test('should be a equal to props', () async {
      const testDetail = MovieDetail(
        adult: false,
        backdropPath: 'backdropPath',
        movieGenres: [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        movieId: 1,
        originalTitle: 'originalTitle',
        movieOverview: 'overview',
        moviePosterPath: 'posterPath',
        releaseDate: 'releaseDate',
        movieRuntime: 120,
        movieTitle: 'title',
        movieVoteAverage: 1,
        voteCount: 1,
      );

      const listValue = [
        false,
        'backdropPath',
        [
          Genre(id: 1, name: 'Action'),
          Genre(id: 2, name: 'Comedy'),
          Genre(id: 3, name: 'Romance'),
        ],
        1,
        'originalTitle',
        'overview',
        'posterPath',
        'releaseDate',
        120,
        'title',
        1.0,
        1,
        ItemType.movie,
      ];

      expect(testDetail.props, listValue);
    });

    test('should be a true because category is Movie', () async {
      expect(testMovieDetail.category, ItemType.movie);
    });
  });
}
