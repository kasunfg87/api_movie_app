import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/movie_header.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:movie_app/presentation/widgets/synopsis.dart';
import 'package:movie_app/presentation/widgets/thumbnail_image.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          const ThumbnailImage(
            networkImage:
                'https://lumiere-a.akamaihd.net/v1/images/image_b81e5aed.jpeg',
          ),
          const GradientBackground(),
          SingleChildScrollView(
            padding: EdgeInsets.only(
                left: 20, right: 20, top: SizeConfig.h(context) * 0.4),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieHeader(
                  movieTilte: 'Star Wars: The Last Jedi',
                  movietime: "152 minutes",
                  movieRating: '7.5 (IMDB)',
                  movieReleaseDate: 'December 9.2017',
                  movieGenre: [
                    'Action',
                    'Drama',
                  ],
                ),
                Synopsis(
                    movieSynopsis:
                        'Jedi Master-in-hiding Luke Skywalker unwillingly attempts to guide young hopeful Rey in the ways of the force, while Leia, former princess turned general, attempts to lead what is left of the Resistance away from the ruthless tyrannical grip of the First Order.'),
                SizedBox(
                  height: 20,
                ),
                ReletedMovie(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
