import 'base_detail_bloc.dart';

class BaseDetailBlocState<T extends BaseItemDetail, Y extends BaseItemEntity>
    extends Equatable {
  final T? baseItemDetail;
  final RequestState baseItemState;
  final String baseItemMessage;

  final List<Y> recommendations;
  final RequestState recommendationState;
  final String? recommendationMessage;

  final bool isAddedToWatchlist;
  final String addedToWatchlistMessage;

  const BaseDetailBlocState({
    this.baseItemDetail,
    this.baseItemState = RequestState.empty,
    this.baseItemMessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.empty,
    this.recommendationMessage = '',
    this.isAddedToWatchlist = false,
    this.addedToWatchlistMessage = '',
  });

  factory BaseDetailBlocState.loadingState() {
    return const BaseDetailBlocState(
      recommendationState: RequestState.loading,
      baseItemState: RequestState.loading,
    );
  }

  factory BaseDetailBlocState.errorState(String message) {
    return BaseDetailBlocState(
      baseItemMessage: message,
      baseItemState: RequestState.error,
    );
  }

  factory BaseDetailBlocState.loadedState(T? baseItem) {
    return BaseDetailBlocState<T, Y>(
      baseItemDetail: baseItem,
      baseItemState: RequestState.loaded,
    );
  }

  BaseDetailBlocState<T, Y> copyWith({
    T? baseItemDetail,
    RequestState? baseItemState,
    String? baseItemMessage,
    List<Y>? recommendations,
    RequestState? recommendationState,
    String? recommendationMessage,
    bool? isAddedToWatchlist,
    String? addedToWatchlistMessage,
  }) {
    return BaseDetailBlocState<T, Y>(
      baseItemDetail: baseItemDetail ?? this.baseItemDetail,
      baseItemState: baseItemState ?? this.baseItemState,
      baseItemMessage: baseItemMessage ?? this.baseItemMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
      addedToWatchlistMessage:
          addedToWatchlistMessage ?? this.addedToWatchlistMessage,
    );
  }

  @override
  List<Object?> get props => [
        baseItemDetail,
        baseItemState,
        baseItemMessage,
        recommendations,
        recommendationState,
        recommendationMessage,
        isAddedToWatchlist,
        addedToWatchlistMessage
      ];
}
