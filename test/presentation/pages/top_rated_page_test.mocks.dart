// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/presentation/pages/top_rated_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i11;

import 'package:dartz/dartz.dart' as _i9;
import 'package:ditonton_dicoding_submission/common/failure.dart' as _i10;
import 'package:ditonton_dicoding_submission/common/state_enum.dart' as _i5;
import 'package:ditonton_dicoding_submission/domain/entities/movie.dart' as _i6;
import 'package:ditonton_dicoding_submission/domain/entities/tv_series.dart' as _i13;
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_movies.dart' as _i2;
import 'package:ditonton_dicoding_submission/domain/usecases/get_top_rated_tv_series.dart' as _i3;
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_movies_notifier.dart'
    as _i4;
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_tv_series_notifier.dart'
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

class _FakeGetTopRatedMovies_0 extends _i1.SmartFake
    implements _i2.GetTopRatedMovies {
  _FakeGetTopRatedMovies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopRatedTvSeries_1 extends _i1.SmartFake
    implements _i3.GetTopRatedTvSeries {
  _FakeGetTopRatedTvSeries_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TopRatedMoviesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRatedMoviesNotifier extends _i1.Mock
    implements _i4.TopRatedMoviesNotifier {
  MockTopRatedMoviesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTopRatedMovies get getTopRatedMovies => (super.noSuchMethod(
        Invocation.getter(#getTopRatedMovies),
        returnValue: _FakeGetTopRatedMovies_0(
          this,
          Invocation.getter(#getTopRatedMovies),
        ),
      ) as _i2.GetTopRatedMovies);

  @override
  _i5.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i5.RequestState.empty,
      ) as _i5.RequestState);

  @override
  List<_i6.Movie> get baseTopRatedList => (super.noSuchMethod(
        Invocation.getter(#baseTopRatedList),
        returnValue: <_i6.Movie>[],
      ) as List<_i6.Movie>);

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
  _i8.Future<void> fetchTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMovies,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> fetchTopRatedMoviesOrTvSeries(
          {required _i8.Future<_i9.Either<_i10.Failure, List<_i6.Movie>>>?
              result}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMoviesOrTvSeries,
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

/// A class which mocks [TopRatedTvSeriesNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRatedTvSeriesNotifier extends _i1.Mock
    implements _i12.TopRatedTvSeriesNotifier {
  MockTopRatedTvSeriesNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetTopRatedTvSeries get getTopRatedTvSeries => (super.noSuchMethod(
        Invocation.getter(#getTopRatedTvSeries),
        returnValue: _FakeGetTopRatedTvSeries_1(
          this,
          Invocation.getter(#getTopRatedTvSeries),
        ),
      ) as _i3.GetTopRatedTvSeries);

  @override
  _i5.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i5.RequestState.empty,
      ) as _i5.RequestState);

  @override
  List<_i13.TvSeries> get baseTopRatedList => (super.noSuchMethod(
        Invocation.getter(#baseTopRatedList),
        returnValue: <_i13.TvSeries>[],
      ) as List<_i13.TvSeries>);

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
  _i8.Future<void> fetchTopRatedTvSeries() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedTvSeries,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> fetchTopRatedMoviesOrTvSeries(
          {required _i8.Future<_i9.Either<_i10.Failure, List<_i13.TvSeries>>>?
              result}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMoviesOrTvSeries,
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
