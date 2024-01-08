import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('TvSeriesDetail', () {
    test('should be a equal to other TvSeriesDetail', () async {
      const detail1 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail == detail1);
    });

    test('should be a not equal because different adult', () async {
      const detail2 = TvSeriesDetail(
        adult: true,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different backdropPath', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdrop_Path',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different list genres', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action'), Genre(id: 2, name: 'Comedy')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different id', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 2,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different originalName', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'original Title',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different overview', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overviewer',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different posterPath', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPaths',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different episodeRunTime', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: 10,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different name', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "name",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different popularity', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 3,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different status', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "",
        tagline: "",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different tagline', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "-",
        tvSeriesVoteAverage:  1,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different voteAverage', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview:  'overview',
        tvSeriesPosterPath:  'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage:  10,
        voteCount: 1,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a not equal because different voteCount', () async {
      const detail2 = TvSeriesDetail(
        adult: false,
        backdropPath: 'backdropPath',
        tvSeriesGenres: [Genre(id: 1, name: 'Action')],
        tvSeriesId: 1,
        originalName: 'originalTitle',
        tvSeriesOverview: 'overview',
        tvSeriesPosterPath: 'posterPath',
        episodeRunTime: null,
        name: "title",
        popularity: 380.213,
        status: "Returning Series",
        tagline: "",
        tvSeriesVoteAverage: 1,
        voteCount: 100,
      );
      expect(true, testTvSeriesDetail != detail2);
    });

    test('should be a true because category is TvSeries', () async {
      expect(testTvSeriesDetail.category, ItemType.tvSeries);
    });
  });
}
