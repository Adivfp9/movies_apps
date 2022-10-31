import 'package:flutter/material.dart';
import 'package:movies_apps/ui/dashboard/home.dart';
import 'package:movies_apps/ui/movies/movies_detail.dart';
import 'package:movies_apps/ui/nowplaying/nowplaying_page.dart';
import 'package:movies_apps/ui/splash_screen.dart';
import 'package:movies_apps/ui/toprated/toprated_page.dart';
import 'package:movies_apps/ui/upcoming/upcoming_page.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/toprated':
        return MaterialPageRoute(builder: (_) => const TopRatedPage());
      case '/moviedetail':
        final args = settings.arguments as MovieDetailPage;
        return MaterialPageRoute(builder: (context) {
          return MovieDetailPage(heroId: args.heroId, movie: args.movie);
        });
      case '/nowplaying_all':
        return MaterialPageRoute(builder: (_) => const NowPlayingPage());
      case '/toprated_all':
        return MaterialPageRoute(builder: (_) => const TopRatedPage());
      case '/upcoming_all':
        return MaterialPageRoute(builder: (_) => const UpComingPage());
    }
    return null;
  }
}
