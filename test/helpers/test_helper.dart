import 'package:ditonton_dicoding_submission/data/datasources/db/database_helper.dart';
import 'package:ditonton_dicoding_submission/data/datasources/movie_local_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton_dicoding_submission/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  TvSeriesRepository,
  MovieRemoteDataSource,
  TvSeriesRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
