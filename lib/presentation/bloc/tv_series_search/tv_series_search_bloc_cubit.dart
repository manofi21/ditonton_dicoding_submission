import 'package:ditonton_dicoding_submission/domain/usecases/search_tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc.dart';

import '../base_search/base_search_bloc_cubit.dart';

class TvSeriesSearchBlocCubit extends BaseSearchListBlocCubit<TvSeries> {
  final SearchTvSeries searchTvSeries;

  TvSeriesSearchBlocCubit({required this.searchTvSeries});

  Future<void> fetchTvSeriesSearch(String query) async {
    await fetchMovieOrTvSeriesSearch(
      searchTvSeries.execute(query),
    );
  }
}
