import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/foundation.dart';

class BaseHomeListNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  var _homeList = <T>[];
  List<T> get homeList => _homeList;

  var _homelistState = RequestState.empty;
  RequestState get homelistState => _homelistState;

  String _message = '';
  String get message => _message;

  Future<void> getCurrenlyOnAirOrNowPlaying(Future<Either<Failure, List<T>>> execute) async {
    _homelistState = RequestState.loading;
    notifyListeners();

    final result = await execute;
    result.fold(
      (failure) {
        _homelistState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _homelistState = RequestState.loaded;
        _homeList = moviesData;
        notifyListeners();
      },
    );
  }
}
