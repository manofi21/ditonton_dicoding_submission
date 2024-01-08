import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';

// ignore: must_be_immutable
class Movie extends BaseItemEntity {
  static ItemType typeMovie = ItemType.movie;
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.movieId,
    required this.originalTitle,
    required this.movieOverview,
    required this.popularity,
    required this.moviePosterPath,
    required this.releaseDate,
    required this.movieTitle,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          title: movieTitle ?? '',
          overview: movieOverview ?? '',
          posterPath: moviePosterPath ?? '',
          id: movieId,
          type: typeMovie,
        );

  Movie.watchlist({
    required this.movieId,
    this.movieOverview,
    this.moviePosterPath,
    this.movieTitle,
  }) : super(
            id: movieId,
            overview: movieOverview ?? '',
            posterPath: moviePosterPath ?? '',
            title: movieTitle ?? '',
            type: typeMovie);

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int movieId;
  String? originalTitle;
  String? movieOverview;
  double? popularity;
  String? moviePosterPath;
  String? releaseDate;
  String? movieTitle;
  bool? video;
  double? voteAverage;
  int? voteCount;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        type,
      ];
}
