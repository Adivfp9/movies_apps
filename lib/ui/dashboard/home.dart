import 'package:flutter/material.dart';
import 'package:movies_apps/ui/dashboard/dashboard.dart';
import 'package:movies_apps/ui/movies/movies.dart';
import 'package:movies_apps/ui/tvshow/tvshow.dart';
import 'package:movies_apps/ui/watchlist/watchlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;
  final widgetChild = [
    const Dashboard(),
    const MoviesPage(),
    const TvShowPages(),
    const WatchList(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'InCinema',
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: widgetChild.elementAt(selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV Show"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
        currentIndex: selectedItem,
        fixedColor: Colors.orangeAccent,
        onTap: onTapItem,
        unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.black,
        showUnselectedLabels: true,
      ),
    ));
  }

  void onTapItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }
}
