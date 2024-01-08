import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/common/failure.dart';
import 'package:ditonton_dicoding_submission/domain/repositories/tv_series_repository.dart';

class GetTvSeriesRecommendations {
  final TvSeriesRepository tvSeriesRepository;

  GetTvSeriesRecommendations(this.tvSeriesRepository);

  Future<Either<Failure, List<TvSeries>>> execute(id) {
    return tvSeriesRepository.getTvSeriesRecommendation(id);
  }
}
