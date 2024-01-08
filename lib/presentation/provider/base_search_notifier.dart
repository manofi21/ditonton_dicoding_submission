import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/foundation.dart';

class BaseSearchNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<T> _searchResult = [];
  List<T> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieOrTvSeriesSearch(Future<Either<Failure, List<T>>> execute) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await execute;
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
