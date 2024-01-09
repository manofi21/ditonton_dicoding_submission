import 'dart:convert';
import 'dart:io';

import 'package:ditonton_dicoding_submission/data/models/movie_detail_model.dart';
import 'package:ditonton_dicoding_submission/data/models/movie_model.dart';
import 'package:ditonton_dicoding_submission/data/models/movie_response.dart';
import 'package:ditonton_dicoding_submission/common/exception.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODExMTQzNTI2NWI4ZWFkNDU2MzU3NzdmYmI2YjhlYyIsInN1YiI6IjY1OGMwOTdmZTE4ZTNmN2FhOGY5YzkxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rBGn6WtFAG-ZNiCEEf6igC4QcPA6TWnrlgHU17JlV68';
  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/now_playing'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$id'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$id/recommendations'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/popular'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/top_rated'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/search/movie?query=$query'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
