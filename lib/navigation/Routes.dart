import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdatbase/Bottomnavigation/Bottom.dart';
import 'package:localdatbase/Pages/HomeScreen.dart';
import 'package:localdatbase/Pages/Movie.dart';
import 'package:localdatbase/animation/lefttorightanimation.dart';
import 'package:localdatbase/navigation/route_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesscreen.Home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routesscreen.Movie:
        return MaterialPageRoute(
          builder: (context) => Movie(),
        );
      case Routesscreen.Bottom:
        return MaterialPageRoute(
          builder: (context) => Bottomscreen(),
        );
      case Routesscreen.RighttoLeftanimations:
        return MaterialPageRoute(
          builder: (context) => RightToLeftImageAnimation(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('No Page  found'),
          ),
        );
    }
  }
}
