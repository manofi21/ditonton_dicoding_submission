import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/popular_list_page.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'popular_page_test.mocks.dart';

@GenerateMocks([PopularMoviesNotifier, PopularTvSeriesNotifier])
void main() {
  late MockPopularMoviesNotifier mockPopularMovieNotifier;
  late MockPopularTvSeriesNotifier mockPopularTvSerisNotifier;

  setUp(() {
    mockPopularMovieNotifier = MockPopularMoviesNotifier();
    mockPopularTvSerisNotifier = MockPopularTvSeriesNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PopularMoviesNotifier>.value(
          value: mockPopularMovieNotifier,
        ),
        ChangeNotifierProvider<PopularTvSeriesNotifier>.value(
          value: mockPopularTvSerisNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page type movie should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockPopularMovieNotifier.state).thenReturn(RequestState.loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.movie,
        ),
      ),
    );

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets(
      'Page type tv series should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockPopularTvSerisNotifier.state).thenReturn(RequestState.loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.tvSeries,
        ),
      ),
    );

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page type movie should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockPopularMovieNotifier.state).thenReturn(RequestState.loaded);
    when(mockPopularMovieNotifier.popularList).thenReturn(<Movie>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.movie,
        ),
      ),
    );

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page type tv series should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockPopularTvSerisNotifier.state).thenReturn(RequestState.loaded);
    when(mockPopularTvSerisNotifier.popularList).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.tvSeries,
        ),
      ),
    );

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page type movie should display text with message when Error',
      (WidgetTester tester) async {
    when(mockPopularMovieNotifier.state).thenReturn(RequestState.error);
    when(mockPopularMovieNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.movie,
        ),
      ),
    );

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Page type tv series should display text with message when Error',
      (WidgetTester tester) async {
    when(mockPopularTvSerisNotifier.state).thenReturn(RequestState.error);
    when(mockPopularTvSerisNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(
      makeTestableWidget(
        const PopularListPage(
          itemType: ItemType.tvSeries,
        ),
      ),
    );

    expect(textFinder, findsOneWidget);
  });
}
