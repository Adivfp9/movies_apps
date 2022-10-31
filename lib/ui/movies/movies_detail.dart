import 'package:flutter/material.dart';
import 'package:movies_apps/models/movie.dart';
import 'package:movies_apps/repository/provider/movie_detail_provider.dart';
// import 'package:movies_apps/ui/widgets/genre.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  final Movies movie;
  final String heroId;
  const MovieDetailPage({super.key, required this.movie, required this.heroId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MovieDetailProvider(),
      child: Consumer<MovieDetailProvider>(
        builder: (context, state, child) {
          return SafeArea(
            child: Scaffold(
                body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        widget.movie.backdropPath == null
                            ? Image.asset(
                                'assets/images/na.jpg',
                                fit: BoxFit.cover,
                              )
                            : FadeInImage(
                                width: double.infinity,
                                height: double.infinity,
                                image: NetworkImage(
                                    '${state.imgPath}original/${widget.movie.backdropPath!}'),
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(
                                    'assets/images/loading.gif'),
                              ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.orangeAccent.withOpacity(0.3),
                                    Colors.blueGrey.withOpacity(0.2),
                                    Colors.blueGrey.withOpacity(0.1),
                                  ],
                                  stops: const [
                                    0.0,
                                    0.25,
                                    0.5,
                                    0.75
                                  ])),
                        )
                      ],
                    )),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.orangeAccent,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 75, 16, 16),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 120.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.movie.title!,
                                                style: const TextStyle(
                                                    fontFamily: 'Sans',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 26),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      widget.movie.voteAverage!,
                                                      style: const TextStyle(
                                                          fontFamily: 'Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.green,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Column(
                                            children: <Widget>[
                                              // if (widget.genres.isEmpty)
                                              //   Container()
                                              // else
                                              //   GenreListPage(
                                              //     genres: widget.genres,
                                              //     totalGenres: state.genreList,
                                              //   ),
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text(
                                                      'Overview',
                                                      style: TextStyle(
                                                          fontFamily: 'Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.movie.overview!,
                                                  style: const TextStyle(
                                                      fontFamily: 'Sans',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 4.0),
                                                    child: Text(
                                                      'Release date : ${widget.movie.releaseDate}',
                                                      style: const TextStyle(
                                                          fontFamily: 'Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    (35 / 100),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: const Text(
                                                    "Add to Watchlist"),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 40,
                              child: Hero(
                                tag: widget.heroId,
                                child: SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: widget.movie.posterPath == null
                                        ? Image.asset(
                                            'assets/images/na.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : FadeInImage(
                                            image: NetworkImage(
                                                '${state.imgPath}w500/${widget.movie.posterPath!}'),
                                            fit: BoxFit.cover,
                                            placeholder: const AssetImage(
                                                'assets/images/loading.gif'),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
