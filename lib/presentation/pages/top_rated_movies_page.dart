import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedListPage extends StatefulWidget {
  final ItemType itemType;
  static const routeName = '/top-rated-movie';

  const TopRatedListPage({super.key, required this.itemType});

  @override
  State<TopRatedListPage> createState() => _TopRatedListPageState();
}

class _TopRatedListPageState extends State<TopRatedListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => widget.itemType == ItemType.movie
        ? Provider.of<TopRatedMoviesNotifier>(context, listen: false)
            .fetchTopRatedMovies()
        : Provider.of<TopRatedTvSeriesNotifier>(context, listen: false)
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
            ? Consumer<TopRatedMoviesNotifier>(
                builder: (context, data, child) {
                  if (data.state == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (data.state == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = data.baseTopRatedList[index];
                        return MovieCard(movie);
                      },
                      itemCount: data.baseTopRatedList.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(data.message),
                    );
                  }
                },
              )
            : Consumer<TopRatedTvSeriesNotifier>(
                builder: (context, data, child) {
                  if (data.state == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (data.state == RequestState.loaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = data.baseTopRatedList[index];
                        return MovieCard(movie);
                      },
                      itemCount: data.baseTopRatedList.length,
                    );
                  } else {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(data.message),
                    );
                  }
                },
              ),
      ),
    );
  }
}
