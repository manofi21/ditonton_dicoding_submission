import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/foundation.dart';

class BaseTopRatedNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<T> _list = [];
  List<T> get baseTopRatedList => _list;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedMoviesOrTvSeries({
    required Future<Either<Failure, List<T>>> result,
  }) async {
    _state = RequestState.loading;
    notifyListeners();

    final getResult = await result;

    getResult.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (listData) {
        _list = listData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
