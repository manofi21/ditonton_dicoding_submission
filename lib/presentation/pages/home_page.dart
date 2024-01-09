import 'package:ditonton_dicoding_submission/presentation/pages/about_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/home_movie_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/home_tv_series_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/search_page.dart';
import 'package:ditonton_dicoding_submission/presentation/pages/watchlist_page.dart';
import 'package:ditonton_dicoding_submission/presentation/widgets/tab_bar_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const  Icon(Icons.movie),
              title: const  Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const  Icon(Icons.save_alt),
              title: const  Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading:const  Icon(Icons.info_outline),
              title:const  Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:const  Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon:const  Icon(Icons.search),
          )
        ],
      ),
      body:const  Padding(
        padding: EdgeInsets.all(8.0),
        child: TabBarHomePage(
          widgets: [
            HomeMoviePage(),
            HomeTvSeriesPage(),
          ],
        ),
      ),
    );
  }
}
