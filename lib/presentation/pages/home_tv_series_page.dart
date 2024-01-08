import 'package:ditonton_dicoding_submission/common/constants.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/home_list_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/popular_list_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_list_notifier.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTvSeriesPage extends StatefulWidget {
  const HomeTvSeriesPage({super.key});

  // static const routeName = '/home-tvseries';

  @override
  State<HomeTvSeriesPage> createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<TvSeriesListNotifier>(context, listen: false)
          ..fetchNowPlayingTvSeries()
          ..fetchPopularTvSeries()
          ..fetchTopRatedTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubHeading(
            title: 'On The Air',
            onTap: () => Navigator.pushNamed(
                context, HomeListPage.routeName,
                arguments: ItemType.tvSeries),
          ),
          Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
            final state = data.nowPlayingState;
            if (state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == RequestState.loaded) {
              return MovieList(data.nowPlayingTs);
            } else {
              return const Text('Failed');
            }
          }),
          _buildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(
                context, PopularListPage.routeName,
                arguments: ItemType.tvSeries),
          ),
          Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
            final state = data.popularTsState;
            if (state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == RequestState.loaded) {
              return MovieList(data.popularTs);
            } else {
              return const Text('Failed');
            }
          }),
          _buildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(
                context, TopRatedListPage.routeName,
                arguments: ItemType.tvSeries),
          ),
          Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
            final state = data.topRatedTsState;
            if (state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == RequestState.loaded) {
              return MovieList(data.topRatedTs);
            } else {
              return const Text('Failed');
            }
          }),
        ],
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
