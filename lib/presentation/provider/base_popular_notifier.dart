import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/material.dart';

class BasePopularNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  var _list = <T>[];
  List<T> get popularList => _list;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> onPopularMovieOrTvSeries({
    required Future<Either<Failure, List<T>>> result,
  }) async {
    _state = RequestState.loading;
    notifyListeners();

    final getResult = await result;
    getResult.fold(
      (failure) {
        _state = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _state = RequestState.loaded;
        _list = moviesData;
        notifyListeners();
      },
    );
  }

}