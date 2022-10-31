import 'package:flutter/material.dart';
import 'package:movies_apps/models/genre.dart';
import 'package:movies_apps/repository/provider/genre_provider.dart';
import 'package:provider/provider.dart';

class GenreListPage extends StatefulWidget {
  final List<int> genres;
  final List<Genres> totalGenres;
  const GenreListPage(
      {super.key, required this.genres, required this.totalGenres});

  @override
  State<GenreListPage> createState() => _GenreListPageState();
}

class _GenreListPageState extends State<GenreListPage> {
  List<Genres>? _genres;
  @override
  void initState() {
    super.initState();
    _genres = [];
    Future.delayed(Duration.zero, () {
      for (var valueGenre in widget.totalGenres) {
        for (var genre in widget.genres) {
          if (valueGenre.id == genre) {
            _genres?.add(valueGenre);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GenreProvider(),
      child: Consumer<GenreProvider>(
        builder: ((context, state, child) {
          return SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: _genres == null
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _genres!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.red),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              label: Text(
                                _genres![index].name!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        },
                      ),
              ));
        }),
      ),
    );
  }
}
