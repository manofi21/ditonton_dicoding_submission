import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('Movie', () {
    test('should be a equal to other Movie', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie == movie);
    });

    test('should be a not equal because adult different', () async {
      final movie = Movie(
        adult: true,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because backdropPath different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.exe',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because genreIds different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28, 3],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview: 
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because id different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 55,
        originalTitle: 'Spider-Man',
        movieOverview: 
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });


    test('should be a not equal because originalTitle different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'SpiderMan',
        movieOverview: 
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because overview different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview: 'This is overview.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because popularity different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because posterPath different', () async {
      final movie = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.png',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.2,
        voteCount: 13507,
      );
      expect(true, testMovie != movie);
    });

    test('should be a not equal because releaseDate different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002/05/01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.3,
        voteCount: 13507,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a not equal because title different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.3,
        voteCount: 13507,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a not equal because title different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'SpiderMan',
        video: false,
        voteAverage: 7.3,
        voteCount: 13507,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a not equal because video different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: true,
        voteAverage: 7.3,
        voteCount: 13507,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a not equal because voteAverage different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.3,
        voteCount: 13507,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a not equal because voteCount different', () async {
      final movie2 = Movie(
        adult: false,
        backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
        genreIds: const [14, 28],
movieId: 557,
        originalTitle: 'Spider-Man',
        movieOverview:
            'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
        popularity: 60.441,
        moviePosterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
        releaseDate: '2002-05-01',
        movieTitle: 'Spider-Man',
        video: false,
        voteAverage: 7.3,
        voteCount: 1350,
      );
      expect(true, testMovie != movie2);
    });

    test('should be a true because category is Movie', () async {
      expect(testMovie.type, ItemType.movie);
    });
  });

  group('Movie.watchlist', () {
    test('should be a equal to other Movie', () async {
      final movieWatchlist = Movie(
        adult: null,
        backdropPath: null,
        genreIds: null,
movieId: 1,
        originalTitle: null,
        movieOverview: 'overview',
        popularity: null,
        moviePosterPath: 'posterPath',
        releaseDate: null,
        movieTitle: 'title',
        video: null,
        voteAverage: null,
        voteCount: null,
      );
      expect(true, testWatchlistMovie == movieWatchlist);
    });

    test('should be a not equal because adult true', () async {
      final movieWatchlist2 = Movie(
        adult: true,
        backdropPath: 'backdropPath',
        genreIds: null,
movieId: 1,
        originalTitle: null,
        movieOverview: 'overview',
        popularity: null,
        moviePosterPath: 'posterPath',
        releaseDate: null,
        movieTitle: 'title',
        video: null,
        voteAverage: null,
        voteCount: null,
      );
      expect(true, testWatchlistMovie != movieWatchlist2);
    });

    test('should be a true because category is Movie', () async {
      expect(testMovie.type, ItemType.movie);
    });
  });
}
