import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/detail_page.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'detail_page_test.mocks.dart';

@GenerateMocks([MovieDetailNotifier, TvSeriesDetailNotifier])
void main() {
  late MockMovieDetailNotifier mockMovieDetailNotifier;
  late MockTvSeriesDetailNotifier mockTvSeriesDetailNotifier;

  setUp(() {
    mockMovieDetailNotifier = MockMovieDetailNotifier();
    mockTvSeriesDetailNotifier = MockTvSeriesDetailNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieDetailNotifier>.value(
          value: mockMovieDetailNotifier,
        ),
        ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
          value: mockTvSeriesDetailNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.itemDetail).thenReturn(testMovieDetail);
    when(mockMovieDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.recommendations).thenReturn(<Movie>[]);
    when(mockMovieDetailNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(
          baseItemEntity: testMovie,
        ),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when TV Series not added to watchlist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.itemDetail).thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.recommendations).thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(
          baseItemEntity: testTvSeries,
        ),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(mockMovieDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.itemDetail).thenReturn(testMovieDetail);
    when(mockMovieDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.recommendations).thenReturn(<Movie>[]);
    when(mockMovieDetailNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testMovie),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when TV Series is added to wathclist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.itemDetail).thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.recommendations).thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testTvSeries),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to movie watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.itemDetail).thenReturn(testMovieDetail);
    when(mockMovieDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.recommendations).thenReturn(<Movie>[]);
    when(mockMovieDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockMovieDetailNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testMovie),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to TV Series watchlist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.itemDetail).thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.recommendations).thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockTvSeriesDetailNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testTvSeries),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to Movie watchlist failed',
      (WidgetTester tester) async {
    when(mockMovieDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.itemDetail).thenReturn(testMovieDetail);
    when(mockMovieDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockMovieDetailNotifier.recommendations).thenReturn(<Movie>[]);
    when(mockMovieDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockMovieDetailNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testMovie),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to TV Series watchlist failed',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.state).thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.itemDetail).thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);
    when(mockTvSeriesDetailNotifier.recommendations).thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockTvSeriesDetailNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(
      makeTestableWidget(
        DetailPage(baseItemEntity: testTvSeries),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.movieState).thenReturn(RequestState.loaded);
  //   when(mockNotifier.movie).thenReturn(testMovieDetail);
  //   when(mockNotifier.recommendationState).thenReturn(RequestState.loaded);
  //   when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
  //   when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   when(mockNotifier.watchlistMessage).thenReturn('Failed');

  //   final watchlistButton = find.byType(ElevatedButton);

  //   await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}
