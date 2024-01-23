// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ditonton_dicoding_submission/common/state_enum.dart';

import '../../../domain/entities/base_item_entity.dart';

class BaseHomeListBlocState<T extends BaseItemEntity> extends Equatable {
  final List<T> homeListValue;
  final RequestState homeListState;
  final String homeListMessageError;

  const BaseHomeListBlocState({
    this.homeListValue = const [],
    this.homeListState = RequestState.empty,
    this.homeListMessageError = '',
  });

  BaseHomeListBlocState<T> copyWith({
    List<T>? homeListValue,
    RequestState? homeListState,
    String? homeListMessageError,
  }) {
    return BaseHomeListBlocState<T>(
      homeListValue: homeListValue ?? this.homeListValue,
      homeListState: homeListState ?? this.homeListState,
      homeListMessageError: homeListMessageError ?? this.homeListMessageError,
    );
  }

  @override
  List<Object> get props => [homeListValue, homeListState, homeListMessageError];
}
