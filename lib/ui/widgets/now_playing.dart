import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/now_playing_provider.dart';
import 'package:movies_apps/ui/movies/movies_detail.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NowPlayingProvider(),
      child: Consumer<NowPlayingProvider>(builder: (context, state, child) {
        return Card(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Now Playing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/nowplaying_all');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("See All",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54)),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: state.movieList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movieList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MovieDetailPage(
                                    //               movie: state.movieList[index],
                                    //               heroId:
                                    //                   '${state.movieList[index].id}',
                                    //             )));
                                    Navigator.of(context).pushNamed(
                                        '/moviedetail',
                                        arguments: MovieDetailPage(
                                            movie: state.movieList[index],
                                            heroId:
                                                '${state.movieList[index].id}'));
                                  },
                                  child: Hero(
                                    tag:
                                        '${state.movieList[index].id}nowplaying',
                                    child: SizedBox(
                                      width: 125,
                                      child: Stack(children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: FadeInImage(
                                              image: NetworkImage(
                                                  '${state.imgPath}w500/${state.movieList[index].posterPath!}'),
                                              fit: BoxFit.fill,
                                              placeholder: const AssetImage(
                                                  'assets/images/loading.gif'),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.black45),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    state.movieList[index]
                                                        .voteAverage!,
                                                    style: const TextStyle(
                                                        fontFamily: 'Sans',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 13,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                  color: Colors.black45,
                                                ),
                                                child: Text(
                                                  state.movieList[index].title!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                  overflow: TextOverflow.clip,
                                                )))
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
