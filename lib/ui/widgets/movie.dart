import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final String poster;
  final String title;
  final String overview;
  final String rating;
  const MovieCard(
      {super.key,
      required this.poster,
      required this.title,
      required this.overview,
      required this.rating});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Row(
          children: <Widget>[
            SizedBox(height: 180, child: Image.network(widget.poster)),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 180,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20)),
                    const SizedBox(height: 10),
                    Expanded(
                        child: Text(
                      widget.overview.isEmpty
                          ? 'Not Available'
                          : widget.overview,
                      style: const TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 12),
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.rating,
                              style: const TextStyle(
                                  fontFamily: 'Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
