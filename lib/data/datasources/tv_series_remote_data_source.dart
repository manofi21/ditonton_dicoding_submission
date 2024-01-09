import 'dart:convert';
import 'dart:io';

import 'package:ditonton_dicoding_submission/common/exception.dart';
import 'package:ditonton_dicoding_submission/data/models/tv_series_detail_model.dart';
import 'package:ditonton_dicoding_submission/data/models/tv_series_model.dart';
import 'package:ditonton_dicoding_submission/data/models/tv_series_response.dart';
import 'package:http/http.dart' as http;

abstract class TvSeriesRemoteDataSource {
  // Untuk mengambil serial yang sedang popular saja
  Future<List<TvSeriesModel>> getPopularTvSeries();

  // Untuk mengambil serial dengan rating tertinggi
  Future<List<TvSeriesModel>> getTopRatedTvSeries();

  // Untuk mengambil serial yang sedang tayang
  Future<List<TvSeriesModel>> getOnAirTvSeries();

  // Untuk mengambil detail TV Series
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id);

  // Untuk mengambil rekomendasi suatu TV Series
  Future<List<TvSeriesModel>> getTvSeriesRecommendation(int id);

  Future<List<TvSeriesModel>> searchTvSeries(String query);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODExMTQzNTI2NWI4ZWFkNDU2MzU3NzdmYmI2YjhlYyIsInN1YiI6IjY1OGMwOTdmZTE4ZTNmN2FhOGY5YzkxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rBGn6WtFAG-ZNiCEEf6igC4QcPA6TWnrlgHU17JlV68';
  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvSeriesModel>> getOnAirTvSeries() async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/on_the_air'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getPopularTvSeries() async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/popular'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTvSeries() async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/top_rated'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/$id'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesRecommendation(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/$id/recommendations'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> searchTvSeries(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/search/tv?query=$query'),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }
}
