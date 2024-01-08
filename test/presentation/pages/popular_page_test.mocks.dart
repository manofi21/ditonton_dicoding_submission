// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/presentation/pages/popular_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i11;

import 'package:dartz/dartz.dart' as _i9;
import 'package:ditonton_dicoding_submission/common/failure.dart' as _i10;
import 'package:ditonton_dicoding_submission/common/state_enum.dart' as _i6;
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart' as _i5;
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart' as _i13;
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_movies.dart' as _i2;
import 'package:ditonton_dicoding_submission/domain/usecases/get_popular_tv_series.dart' as _i3;
import 'package:ditonton_dicoding_submission/presentation/provider/popular_movies_notifier.dart'
    as _i4;
import 'package:ditonton_dicoding_submission/presentation/provider/popular_tv_series_notifier.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetPopularMovies_0 extends _i1.SmartFake
    implements _i2.GetPopularMovies {
  _FakeGetPopularMovies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetPopularTvSeries_1 extends _i1.SmartFake
    implements _i3.GetPopularTvSeries {
  _FakeGetPopularTvSeries_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularMoviesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularMoviesNotifier extends _i1.Mock
    implements _i4.PopularMoviesNotifier {
  MockPopularMoviesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPopularMovies get getPopularMovies => (super.noSuchMethod(
        Invocation.getter(#getPopularMovies),
        returnValue: _FakeGetPopularMovies_0(
          this,
          Invocation.getter(#getPopularMovies),
        ),
      ) as _i2.GetPopularMovies);

  @override
  List<_i5.Movie> get popularList => (super.noSuchMethod(
        Invocation.getter(#popularList),
        returnValue: <_i5.Movie>[],
      ) as List<_i5.Movie>);

  @override
  _i6.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i6.RequestState.empty,
      ) as _i6.RequestState);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> fetchPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularMovies,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> onPopularMovieOrTvSeries(
          {required _i8.Future<_i9.Either<_i10.Failure, List<_i5.Movie>>>?
              result}) =>
      (super.noSuchMethod(
        Invocation.method(
          #onPopularMovieOrTvSeries,
          [],
          {#result: result},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [PopularTvSeriesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularTvSeriesNotifier extends _i1.Mock
    implements _i12.PopularTvSeriesNotifier {
  MockPopularTvSeriesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetPopularTvSeries get getPopularTvSeries => (super.noSuchMethod(
        Invocation.getter(#getPopularTvSeries),
        returnValue: _FakeGetPopularTvSeries_1(
          this,
          Invocation.getter(#getPopularTvSeries),
        ),
      ) as _i3.GetPopularTvSeries);

  @override
  List<_i13.TvSeries> get popularList => (super.noSuchMethod(
        Invocation.getter(#popularList),
        returnValue: <_i13.TvSeries>[],
      ) as List<_i13.TvSeries>);

  @override
  _i6.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i6.RequestState.empty,
      ) as _i6.RequestState);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> fetchPopularTvSeries() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularTvSeries,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> onPopularMovieOrTvSeries(
          {required _i8.Future<_i9.Either<_i10.Failure, List<_i13.TvSeries>>>?
              result}) =>
      (super.noSuchMethod(
        Invocation.method(
          #onPopularMovieOrTvSeries,
          [],
          {#result: result},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
