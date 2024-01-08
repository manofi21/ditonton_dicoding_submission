
import 'package:ditonton_dicoding_submission/data/models/base_table.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie_detail.dart';

class MovieTable extends BaseTable {
  final int movieId;
  final String? movieTitle;
  final String? moviePosterPath;
  final String? movieOverview;

  MovieTable({
    required this.movieId,
    required this.movieTitle,
    required this.moviePosterPath,
    required this.movieOverview,
  }) : super(
          id: movieId,
          title: movieTitle,
          posterPath: moviePosterPath,
          overview: movieOverview,
          category: Movie.typeMovie.toString(),
        );

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
        movieId: map['id'],
        movieTitle: map['title'],
        moviePosterPath: map['posterPath'],
        movieOverview: map['overview'],
      );

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
        movieId: movie.id,
        movieTitle: movie.title,
        moviePosterPath: movie.posterPath,
        movieOverview: movie.overview,
      );

  Movie toEntity() => Movie.watchlist(
        movieId: id,
        movieOverview: overview,
        moviePosterPath: posterPath,
        movieTitle: title,
      );
}
