import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/upcoming_provider.dart';
import 'package:movies_apps/ui/widgets/movie.dart';
import 'package:provider/provider.dart';

class UpComingPage extends StatefulWidget {
  const UpComingPage({super.key});

  @override
  State<UpComingPage> createState() => _UpComingPageState();
}

class _UpComingPageState extends State<UpComingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UpComingProvider(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Up Coming Moives',
            ),
            backgroundColor: Colors.black,
          ),
          body: Consumer<UpComingProvider>(builder: ((context, state, child) {
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
