import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
