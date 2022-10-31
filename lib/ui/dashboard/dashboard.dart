import 'package:flutter/material.dart';
import 'package:movies_apps/ui/widgets/discover.dart';
import 'package:movies_apps/ui/widgets/now_playing.dart';
import 'package:movies_apps/ui/widgets/toprated.dart';
import 'package:movies_apps/ui/widgets/upcoming.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white70),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [Discover(), TopRated(), NowPlaying(), UpComing()],
      ),
    );
  }
}
