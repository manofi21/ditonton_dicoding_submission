import 'package:ditonton_dicoding_submission/data/models/base_table.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series_detail.dart';

class TvSeriesTable extends BaseTable {
  final int tvSeriesId;
  final String? tvSeriesTitle;
  final String? tvSeriesPosterPath;
  final String? tvSeriesOverview;

  TvSeriesTable({
    required this.tvSeriesId,
    required this.tvSeriesTitle,
    required this.tvSeriesPosterPath,
    required this.tvSeriesOverview,
  }) : super(
          id: tvSeriesId,
          title: tvSeriesTitle,
          posterPath: tvSeriesPosterPath,
          overview: tvSeriesOverview,
          category: TvSeries.typeTvSeries.toString(),
        );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        tvSeriesId: map['id'],
        tvSeriesTitle: map['title'],
        tvSeriesPosterPath: map['posterPath'],
        tvSeriesOverview: map['overview'],
      );

  factory TvSeriesTable.fromEntity(TvSeriesDetail movie) => TvSeriesTable(
        tvSeriesId: movie.id,
        tvSeriesTitle: movie.title,
        tvSeriesPosterPath: movie.posterPath,
        tvSeriesOverview: movie.overview,
      );

  TvSeries toEntity() => TvSeries.watchlist(
        tvSeriesId: id,
        tvSeriesOverview: overview,
        tvSeriesPosterPath: posterPath,
        name: title,
      );
}
