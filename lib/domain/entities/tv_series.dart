import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';


// ignore: must_be_immutable
class TvSeries extends BaseItemEntity {
  static ItemType typeTvSeries = ItemType.tvSeries;

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int tvSeriesId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? tvSeriesOverview;
  double? popularity;
  String? tvSeriesPosterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.tvSeriesId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.tvSeriesOverview,
    required this.popularity,
    required this.tvSeriesPosterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  }): super(
          title: name ?? '',
          overview: tvSeriesOverview ?? '',
          posterPath: tvSeriesPosterPath ?? '',
          id: tvSeriesId,
          type: typeTvSeries,
        );

  TvSeries.watchlist({
    required this.tvSeriesId,
    this.tvSeriesOverview,
    this.tvSeriesPosterPath,
    this.name,
  }) : super(
            id: tvSeriesId,
            overview: tvSeriesOverview ?? '',
            posterPath: tvSeriesPosterPath ?? '',
            title: name ?? '',
            type: typeTvSeries);

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteCount,
      type,
    ];
  }
}
