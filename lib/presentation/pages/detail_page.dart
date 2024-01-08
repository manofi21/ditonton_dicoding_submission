// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_detail.dart';
import 'package:ditonton_dicoding_submission/domain/entities/tv_series_detail.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:ditonton_dicoding_submission/common/constants.dart';
import 'package:ditonton_dicoding_submission/common/state_enum.dart';
import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';
import 'package:ditonton_dicoding_submission/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_submission/presentation/provider/movie_detail_notifier.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  final BaseItemEntity baseItemEntity;
  const DetailPage({
    Key? key,
    required this.baseItemEntity,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (widget.baseItemEntity.type == ItemType.movie) {
        Provider.of<MovieDetailNotifier>(context, listen: false)
            .fetchMovieDetail(widget.baseItemEntity.id);
      } else {
        Provider.of<TvSeriesDetailNotifier>(context, listen: false)
            .fetchTvSeriesDetail(widget.baseItemEntity.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.baseItemEntity.type == ItemType.movie
          ? Consumer<MovieDetailNotifier>(
              builder: (context, provider, child) {
                if (provider.state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (provider.state == RequestState.loaded) {
                  final movie = provider.itemDetail;
                  return SafeArea(
                    child: DetailContent(
                      movie,
                      provider.recommendations,
                      provider.isAddedToWatchlist,
                    ),
                  );
                } else {
                  return Text(provider.message);
                }
              },
            )
          : Consumer<TvSeriesDetailNotifier>(
              builder: (context, provider, child) {
                if (provider.state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (provider.state == RequestState.loaded) {
                  final tvSeries = provider.itemDetail;
                  return SafeArea(
                    child: DetailContent(
                      tvSeries,
                      provider.recommendations,
                      provider.isAddedToWatchlist,
                    ),
                  );
                } else {
                  return Text(provider.message);
                }
              },
            ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final BaseItemDetail itemDetail;
  final List<BaseItemEntity> itemEntities;
  final bool isAddedWatchlist;

  const DetailContent(this.itemDetail, this.itemEntities, this.isAddedWatchlist, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${itemDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemDetail.title,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                var message = '';
                                final detail = itemDetail;
                                if (detail is MovieDetail) {
                                  final movieDetailNotifier =
                                      Provider.of<MovieDetailNotifier>(context,
                                          listen: false);

                                  if (!isAddedWatchlist) {
                                    await movieDetailNotifier
                                        .addWatchlistMovies(detail);
                                  } else {
                                    await movieDetailNotifier
                                        .removeFromWatchlistMovies(detail);
                                  }
                                  message =
                                      movieDetailNotifier.watchlistMessage;
                                }

                                if (detail is TvSeriesDetail ) {
                                  
                                  final tvSeriesDetailNotifier =
                                      // ignore: use_build_context_synchronously
                                      Provider.of<TvSeriesDetailNotifier>(
                                          context,
                                          listen: false);
                                  if (!isAddedWatchlist) {
                                    await tvSeriesDetailNotifier
                                        .addWatchlistTvSeries(detail);
                                  } else {
                                    await tvSeriesDetailNotifier
                                        .removeFromWatchlistTvSeries(detail);
                                  }
                                  message =
                                      tvSeriesDetailNotifier.watchlistMessage;
                                }

                                if (isSuccessOrRemoved(message)) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(itemDetail.genres),
                            ),
                            Text(
                              _showDuration(itemDetail.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: itemDetail.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const  Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${itemDetail.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              itemDetail.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            if (itemDetail is MovieDetail) ...{
                              Consumer<MovieDetailNotifier>(
                                builder: (context, data, child) {
                                  if (data.recommendationState ==
                                      RequestState.loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (data.recommendationState ==
                                      RequestState.error) {
                                    return Text(data.message);
                                  } else if (data.recommendationState ==
                                      RequestState.loaded) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: RecommendationsItems(
                                        listItem: data.recommendations,
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            } else ...{
                              Consumer<TvSeriesDetailNotifier>(
                                builder: (context, data, child) {
                                  if (data.recommendationState ==
                                      RequestState.loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (data.recommendationState ==
                                      RequestState.error) {
                                    return Text(data.message);
                                  } else if (data.recommendationState ==
                                      RequestState.loaded) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: RecommendationsItems(
                                        listItem: data.recommendations,
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            }
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const  Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

bool isSuccessOrRemoved(String message) =>
    message == MovieDetailNotifier.watchlistAddSuccessMessage ||
    message == MovieDetailNotifier.watchlistRemoveSuccessMessage;

class RecommendationsItems extends StatelessWidget {
  final List<BaseItemEntity> listItem;
  const RecommendationsItems({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: listItem
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DetailPage.routeName,
                    arguments: e,
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    height: 300,
                    imageUrl: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
