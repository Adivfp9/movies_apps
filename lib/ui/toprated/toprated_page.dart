import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/toprated_provider.dart';
import 'package:movies_apps/ui/widgets/movie.dart';
import 'package:provider/provider.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TopRatedProvider(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Top Rated',
            ),
            backgroundColor: Colors.black,
          ),
          body: Consumer<TopRatedProvider>(builder: ((context, state, child) {
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
