import 'package:ditonton_dicoding_submission/common/constants.dart';
import 'package:ditonton_dicoding_submission/common/utils.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_home_list/movie_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_search/movie_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_detail/tv_series_detail_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_home_list/tv_series_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_search/tv_series_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/about_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/home_list_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/home_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/detail_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/popular_list_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/search_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/watchlist_page.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_movie_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/home_tv_series_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/popular_tv_series_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_detail_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton_dicoding_submission/injection.dart' as di;

import 'presentation/bloc/movie_detail/movie_detail_cubit.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<HomeMovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<HomeTvSeriesListNotifier>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.locator<MovieDetailCubit>(),
          ),
          BlocProvider(
            create: (_) => di.locator<TvSeriesDetailCubit>(),
          ),
          BlocProvider(
            create: (_) => di.locator<HomeMovieListBlocCubit>(),
          ),
          BlocProvider(
            create: (_) => di.locator<HomeTvSeriesListBlocCubit>(),
          ),
          BlocProvider(
            create: (_) => di.locator<MovieSearchBlocCubit>(),
          ),
          BlocProvider(
            create: (_) => di.locator<TvSeriesSearchBlocCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            colorScheme: kColorScheme,
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack,
            textTheme: kTextTheme,
          ),
          home: const HomePage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(builder: (_) => const HomePage());
              case PopularListPage.routeName:
                final itemType = settings.arguments as ItemType;
                return CupertinoPageRoute(
                  builder: (_) => PopularListPage(
                    itemType: itemType,
                  ),
                  settings: settings,
                );
              case HomeListPage.routeName:
                final itemType = settings.arguments as ItemType;
                return CupertinoPageRoute(
                  builder: (_) => HomeListPage(
                    itemType: itemType,
                  ),
                  settings: settings,
                );
              case TopRatedListPage.routeName:
                final itemType = settings.arguments as ItemType;
                return CupertinoPageRoute(
                  builder: (_) => TopRatedListPage(
                    itemType: itemType,
                  ),
                  settings: settings,
                );
              case DetailPage.routeName:
                final item = settings.arguments as BaseItemEntity;
                return MaterialPageRoute(
                  builder: (_) => DetailPage(baseItemEntity: item),
                  settings: settings,
                );
              case SearchPage.routeName:
                return CupertinoPageRoute(builder: (_) => const SearchPage());
              case WatchlistPage.routeName:
                return MaterialPageRoute(builder: (_) => const WatchlistPage());
              case AboutPage.routeName:
                return MaterialPageRoute(builder: (_) => const AboutPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ),
      ),
    );
  }
}
