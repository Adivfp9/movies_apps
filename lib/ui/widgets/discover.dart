import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_apps/repository/provider/discover_provider.dart';
import 'package:provider/provider.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DiscoverProvider(),
      child: Consumer<DiscoverProvider>(builder: (context, state, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (40 / 100),
                  child: state.movieList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CarouselSlider.builder(
                          options: CarouselOptions(
                              autoPlay: true,
                              disableCenter: true,
                              viewportFraction: 0.7,
                              enlargeCenterPage: true),
                          itemBuilder: (context, int index, realIndex) {
                            return Hero(
                              tag: '${state.movieList[index].id}discover',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage(
                                  image: NetworkImage(
                                      '${state.imgPath}w500/${state.movieList[index].posterPath!}'),
                                  fit: BoxFit.fill,
                                  placeholder: const AssetImage(
                                      'assets/images/loading.gif'),
                                ),
                              ),
                            );
                          },
                          itemCount: state.movieList.length,
                        )),
            )
          ],
        );
      }),
    );
  }
}
