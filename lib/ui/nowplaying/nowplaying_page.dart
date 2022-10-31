import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/now_playing_provider.dart';
import 'package:movies_apps/ui/widgets/movie.dart';
import 'package:provider/provider.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({super.key});

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NowPlayingProvider(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Now Playing',
            ),
            backgroundColor: Colors.black,
          ),
          body: Consumer<NowPlayingProvider>(builder: ((context, state, child) {
            return state.movieList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.movieList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return MovieCard(
                        poster:
                            '${state.imgPath}w500/${state.movieList[index].posterPath!}',
                        title: state.movieList[index].title!,
                        overview: state.movieList[index].overview!,
                        rating: state.movieList[index].voteAverage!,
                      );
                    }));
          })),
        ),
      ),
    );
  }
}
