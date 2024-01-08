import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/material.dart';

class HomeListNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  var _onAirTList = <T>[];
  List<T> get nowPlayingTs => _onAirTList;

  RequestState _nowPlayingState = RequestState.empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTList = <T>[];
  List<T> get popularTs => _popularTList;

  RequestState _popularTsState = RequestState.empty;
  RequestState get popularTsState => _popularTsState;

  var _topRatedTList = <T>[];
  List<T> get topRatedTs => _topRatedTList;

  RequestState _topRatedTsState = RequestState.empty;
  RequestState get topRatedTsState => _topRatedTsState;

  String _message = '';
  String get message => _message;

  void reset() {
    _onAirTList = [];
    _nowPlayingState = RequestState.empty;

    _popularTList = [];
    _popularTsState = RequestState.empty;

    _topRatedTList = [];
    _topRatedTsState = RequestState.empty;
    notifyListeners();
  }

  Future<void> onPlayingMovieOrTvSeries({
    required Future<Either<Failure, List<T>>> result,
  }) async {
    _nowPlayingState = RequestState.loading;
    notifyListeners();

    final getResult = await result;
    getResult.fold(
      (failure) {
        _nowPlayingState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _nowPlayingState = RequestState.loaded;
        _onAirTList = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> onPopularMovieOrTvSeries({
    required Future<Either<Failure, List<T>>> result,
  }) async {
    _popularTsState = RequestState.loading;
    notifyListeners();

    final getResult = await result;
    getResult.fold(
      (failure) {
        _popularTsState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _popularTsState = RequestState.loaded;
        _popularTList = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> onTopRatedMovieOrTvSeries({
    required Future<Either<Failure, List<T>>> result,
  }) async {
    _topRatedTsState = RequestState.loading;
    notifyListeners();

    final getResult = await result;
    getResult.fold(
      (failure) {
        _topRatedTsState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _topRatedTsState = RequestState.loaded;
        _topRatedTList = moviesData;
        notifyListeners();
      },
    );
  }
}
