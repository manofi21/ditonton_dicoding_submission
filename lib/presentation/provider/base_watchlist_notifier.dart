import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter/foundation.dart';

class BaseWatchlistNotifier<T extends BaseItemEntity> extends ChangeNotifier {
  var _watchlist = <T>[];
  List<T> get watchlist => _watchlist;

  var _watchlistState = RequestState.empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  Future<void> fetchWatchlist(Future<Either<Failure, List<T>>> execute) async {
    _watchlistState = RequestState.loading;
    notifyListeners();

    final result = await execute;
    result.fold(
      (failure) {
        _watchlistState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _watchlistState = RequestState.loaded;
        _watchlist = moviesData;
        notifyListeners();
      },
    );
  }
}
