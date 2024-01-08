import 'package:ditonton_dicoding_submission/domain/entities/base_item_detail.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';

class MovieDetail extends BaseItemDetail {
  const MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.movieGenres,
    required this.movieId,
    required this.originalTitle,
    required this.movieOverview,
    required this.moviePosterPath,
    required this.releaseDate,
    required this.movieRuntime,
    required this.movieTitle,
    required this.movieVoteAverage,
    required this.voteCount,
  }) : super(
          title: movieTitle,
          overview: movieOverview,
          posterPath: moviePosterPath,
          id: movieId,
          genres: movieGenres,
          runtime: movieRuntime,
          voteAverage: movieVoteAverage,
          category: ItemType.movie
        );

  final bool adult;
  final String? backdropPath;
  final List<Genre> movieGenres;
  final int movieId;
  final String originalTitle;
  final String movieOverview;
  final String moviePosterPath;
  final String releaseDate;
  final int movieRuntime;
  final String movieTitle;
  final double movieVoteAverage;
  final int voteCount;

  @override
  List<Object> get props => [
        adult,
        backdropPath ?? '',
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        runtime,
        title,
        voteAverage,
        voteCount,
        category,
      ];
}
