import 'package:ditonton_dicoding_submission/data/models/movie_table.dart';
import 'package:ditonton_dicoding_submission/data/models/tv_series_table.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
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

final testMovieList = [testMovie];

final testTvSeries = TvSeries(
  adult: false,
  backdropPath: "/7v3bO3pNnyLHLlwETtmyQxKV2Ba.jpg",
  genreIds: const [35, 10766, 18],
  tvSeriesId: 73362,
  name: "The Ladies' Paradise",
  tvSeriesOverview:
      "Follow Teresa Iorio, a young woman who leaves her rural Sicilian hometown for Milan to find work--and much more--at a newly opened department store: The Ladies' Paradise.",
  popularity: 380.213,
  tvSeriesPosterPath: '/7k0D1feQhS59O2k8xkf5UR19LUi.jpg',
  firstAirDate: "2015-12-08",
  originCountry: const ["IT"],
  originalLanguage: "it",
  originalName: "Il paradiso delle signore",
  voteAverage: 7.625,
  voteCount: 12,
);

final testTvSeriesList = [testTvSeries];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  movieGenres: [
    Genre(id: 1, name: 'Action'),
    Genre(id: 2, name: 'Comedy'),
    Genre(id: 3, name: 'Romance')
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

const testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  tvSeriesGenres: [Genre(id: 1, name: 'Action')],
  tvSeriesId: 1,
  originalName: 'originalTitle',
  tvSeriesOverview: 'overview',
  tvSeriesPosterPath: 'posterPath',
  episodeRunTime: null,
  name: "title",
  popularity: 380.213,
  status: "Returning Series",
  tagline: "",
  tvSeriesVoteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  movieId: 1,
  movieTitle: 'title',
  moviePosterPath: 'posterPath',
  movieOverview: 'overview',
);

final testMovieTable = MovieTable(
  movieId: 1,
  movieTitle: 'title',
  moviePosterPath: 'posterPath',
  movieOverview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
  'category': ItemType.movie.toString()
};

final testWatchlistTvSeries = TvSeries.watchlist(
  tvSeriesId: 1,
  name: 'title',
  tvSeriesPosterPath: 'posterPath',
  tvSeriesOverview: 'overview',
);

final testTvSeriesTable = TvSeriesTable(
  tvSeriesId: 1,
  tvSeriesOverview: 'title',
  tvSeriesPosterPath: 'posterPath',
  tvSeriesTitle: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
  'category': ItemType.tvSeries.toString()
};
