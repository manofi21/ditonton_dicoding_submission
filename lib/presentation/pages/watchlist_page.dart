import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/common/utils.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_watchlist/base_watchlist_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_watchlist/movie_watchlist_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_watchlist/tv_series_watchlist_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<MovieWatchlistBlocCubit>(context, listen: false)
          .fetchWatchlistMovies();
      BlocProvider.of<TvSeriesWatchlistBlocCubit>(context, listen: false)
          .fetchWatchlistTvSeries();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Future.microtask(() {
      BlocProvider.of<MovieWatchlistBlocCubit>(context, listen: false)
          .fetchWatchlistMovies();
      BlocProvider.of<TvSeriesWatchlistBlocCubit>(context, listen: false)
          .fetchWatchlistTvSeries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarHomePage(
            widgets: [
              BlocBuilder<MovieWatchlistBlocCubit, MovieWatchlistListState>(
                builder: (context, state) {
                  if (state.watchlistListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.watchlistListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.watchlistListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.watchlistListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.watchlistListMessageError),
                    );
                  }
                },
              ),
              BlocBuilder<TvSeriesWatchlistBlocCubit, TvSeriesWatchlistListState>(
                builder: (context, state) {
                  if (state.watchlistListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.watchlistListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.watchlistListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.watchlistListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.watchlistListMessageError),
                    );
                  }
                },
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
