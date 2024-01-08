// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ditonton_dicoding_submission/domain/entities/base_item_detail.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';

class TvSeriesDetail extends BaseItemDetail {
  final bool? adult;
  final String? backdropPath;
  final List<Genre> tvSeriesGenres;
  final int tvSeriesId;
  final String? name;
  final String? originalName;
  final String tvSeriesOverview;
  final double? popularity;
  final String tvSeriesPosterPath;
  final String? status;
  final String? tagline;
  final double tvSeriesVoteAverage;
  final int? voteCount;
  final int? episodeRunTime;

  const TvSeriesDetail({
    this.adult,
    this.backdropPath,
    this.tvSeriesGenres = const [],
    required this.tvSeriesId,
    this.name,
    this.originalName,
    required this.tvSeriesOverview,
    this.popularity,
    required this.tvSeriesPosterPath,
    this.status,
    this.tagline,
    required this.tvSeriesVoteAverage,
    this.voteCount,
    this.episodeRunTime,
  }) : super(
            title: name ?? '',
            overview: tvSeriesOverview,
            posterPath: tvSeriesPosterPath,
            id: tvSeriesId,
            genres: tvSeriesGenres,
            runtime: episodeRunTime ?? 0,
            voteAverage: tvSeriesVoteAverage,
            category: ItemType.tvSeries);

  @override
  List<Object> get props => [
        adult ?? false,
        backdropPath ?? '',
        genres,
        id,
        name ?? '',
        originalName ?? '',
        overview,
        popularity ?? '',
        posterPath,
        status ?? '',
        tagline ?? '',
        voteAverage,
        voteCount ?? 0,
        episodeRunTime ?? 0,
        category,
      ];
}
