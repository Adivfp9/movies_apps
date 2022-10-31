import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/movie_provider.dart';
import 'package:movies_apps/ui/widgets/upcoming.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MoviesProvider(),
      child: Consumer<MoviesProvider>(
        builder: (context, state, child) {
          return ListView(
            children: [
              Column(
                children: [
                  const Text(
                    "Now Playing",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Sans',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * (40 / 100),
                        child: state.nowPlayingList.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : CarouselSlider.builder(
                                options: CarouselOptions(
                                    autoPlay: true,
                                    disableCenter: true,
                                    viewportFraction: 0.7,
                                    enlargeCenterPage: true),
                                itemCount: state.nowPlayingList.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  return Hero(
                                    tag:
                                        '${state.nowPlayingList[index].id}nowplay',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            '${state.imgPath}w500/${state.nowPlayingList[index].posterPath!}'),
                                        fit: BoxFit.fill,
                                        placeholder: const AssetImage(
                                            'assets/images/loading.gif'),
                                      ),
                                    ),
                                  );
                                },
                              )),
                  )
                ],
              ),
              const UpComing(),
            ],
          );
        },
      ),
    );
  }
}
