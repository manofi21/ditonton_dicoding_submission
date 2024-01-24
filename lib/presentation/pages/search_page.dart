import 'package:ditonton_dicoding_submission/common/constants.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/base_search/base_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/movie_search/movie_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/bloc/tv_series_search/tv_series_search_bloc_cubit.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/movie_card_list.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Future.microtask(() {
                  BlocProvider.of<MovieSearchBlocCubit>(context, listen: false)
                      .fetchMovieSearch(query);
                  BlocProvider.of<TvSeriesSearchBlocCubit>(context, listen: false)
                      .fetchTvSeriesSearch(query);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            const Text(
              'Search Result',
              style: kHeading6,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: TabBarHomePage(
                widgets: [
                  BlocBuilder<MovieSearchBlocCubit, MovieSearchListState>(
                    builder: (context, state) {
                      if (state.searchListState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.searchListState == RequestState.loaded) {
                        final result = state.searchListValue;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  BlocBuilder<TvSeriesSearchBlocCubit, TvSeriesSearchListState>(
                    builder: (context, state) {
                      if (state.searchListState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.searchListState == RequestState.loaded) {
                        final result = state.searchListValue;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
