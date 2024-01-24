import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_top_rated/base_top_rated_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_top_rated/movie_top_rated_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_top_rated/tv_series_top_rated_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedListPage extends StatefulWidget {
  final ItemType itemType;
  static const routeName = '/top-rated-list';

  const TopRatedListPage({super.key, required this.itemType});

  @override
  State<TopRatedListPage> createState() => _TopRatedListPageState();
}

class _TopRatedListPageState extends State<TopRatedListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => widget.itemType == ItemType.movie
        ? BlocProvider.of<MovieTopRatedBlocCubit>(context, listen: false)
            .fetchTopRatedMovie()
        : BlocProvider.of<TvSeriesTopRatedBlocCubit>(context, listen: false)
            .fetchTopRatedTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.itemType == ItemType.movie
            ? BlocBuilder<MovieTopRatedBlocCubit,MovieTopRatedListState>(
                builder: (context, state) {
                  if (state.topRatedListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.topRatedListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.topRatedListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.topRatedListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.topRatedListMessageError),
                    );
                  }
                },
              )
            : BlocBuilder<TvSeriesTopRatedBlocCubit,TvSeriesTopRatedListState>(
                builder: (context, state) {
                  if (state.topRatedListState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.topRatedListState == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.topRatedListValue[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.topRatedListValue.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.topRatedListMessageError),
                    );
                  }
                },
              )
      ),
    );
  }
}
