import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_popular/base_popular_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_popular/movie_popular_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_popular/tv_series_popular_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/base_item_entity.dart';

class PopularListPage extends StatefulWidget {
  final ItemType itemType;
  static const routeName = '/popular-list';

  const PopularListPage({super.key, required this.itemType});

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => widget.itemType == ItemType.movie
        ? BlocProvider.of<MoviePopularBlocCubit>(context, listen: false)
            .fetchMoviePopular()
        : BlocProvider.of<TvSeriesPopularBlocCubit>(context, listen: false)
            .fetchTvSeriesPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular ${widget.itemType == ItemType.movie ? 'Movies' : 'TV Series'}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.itemType == ItemType.movie
            ? BlocBuilder<MoviePopularBlocCubit, MoviePopularListState>(
                builder: (context, state) {
                  if (state.popularListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.popularListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.popularListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.popularListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.popularListMessageError),
                    );
                  }
                },
              )
            : BlocBuilder<TvSeriesPopularBlocCubit, TvSeriesPopularListState>(
                builder: (context, state) {
                  if (state.popularListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.popularListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.popularListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.popularListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.popularListMessageError),
                    );
                  }
                },
              ),
      ),
    );
  }
}
