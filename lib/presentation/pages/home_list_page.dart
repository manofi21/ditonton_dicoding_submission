import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_home_list/base_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_home_list/movie_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_home_list/tv_series_home_list_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/base_item_entity.dart';


class HomeListPage extends StatefulWidget {
  final ItemType itemType;
  static const routeName = '/home-list';

  const HomeListPage({super.key, required this.itemType});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => widget.itemType == ItemType.movie
        ? BlocProvider.of<HomeMovieListBlocCubit>(context, listen: false)
            .fetchNowPlayingList()
        : BlocProvider.of<HomeTvSeriesListBlocCubit>(context, listen: false)
            .fetchOnAirTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.itemType == ItemType.movie ? 'Now Playing Movies' : 'On Airing Tv Series',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.itemType == ItemType.movie
            ? BlocBuilder<HomeMovieListBlocCubit, MovieHomeListState>(
                builder: (context, state) {
                  if (state.homeListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.homeListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.homeListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.homeListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.homeListMessageError),
                    );
                  }
                },
              )
            : BlocBuilder<HomeTvSeriesListBlocCubit, TvSeriesHomeListState>(
                builder: (context, state) {
                  if (state.homeListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.homeListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final tvSeries = state.homeListValue[index];
                        return MovieCard(tvSeries);
                      },
                      itemCount: state.homeListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.homeListMessageError),
                    );
                  }
                },
              ),
      ),
    );
  }
}
