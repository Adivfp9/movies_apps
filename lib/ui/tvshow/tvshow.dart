import 'package:flutter/material.dart';

class TvShowPages extends StatefulWidget {
  const TvShowPages({super.key});

  @override
  State<TvShowPages> createState() => _TvShowPagesState();
}

class _TvShowPagesState extends State<TvShowPages> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("TV Show"),
    );
  }
}
