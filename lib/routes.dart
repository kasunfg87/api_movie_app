import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/discover/discover.dart';
import 'package:movie_app/presentation/screens/home/home.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';

final Map<String, WidgetBuilder> routes = {
  MyHome.routeName: (context) => const MyHome(),
  DiscoverScreen.routeName: (context) => const DiscoverScreen(),
  MovieDetails.routeName: (context) => const MovieDetails(),
};
