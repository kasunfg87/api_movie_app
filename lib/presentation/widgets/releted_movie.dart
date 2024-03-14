import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/releted_movie_tile.dart';
import 'package:provider/provider.dart';

class ReletedMovie extends StatefulWidget {
  const ReletedMovie({
    super.key,
    required this.movieId,
  });
  final String movieId;

  @override
  State<ReletedMovie> createState() => _ReletedMovieState();
}

class _ReletedMovieState extends State<ReletedMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextLatoSmall(
          text: 'Related Movies',
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 12,
        ),
        Consumer<MovieProvider>(
          builder: (context, value, child) {
            return CarouselSlider.builder(
              itemCount: value.similarMovies.isNotEmpty
                  ? value.similarMovies.length
                  : 0,
              itemBuilder: (context, index, realIndex) {
                return FadeInRight(
                  child: InkWell(
                    onTap: () {
                      value.setMovie(value.similarMovies[index]);
                    },
                    child: RelatedMovieTile(
                      movieImage:
                          'https://image.tmdb.org/t/p/w500${value.similarMovies[index].posterPath}',
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  viewportFraction: 0.30,
                  pageSnapping: true,
                  scrollPhysics: const BouncingScrollPhysics()),
            );
          },
        )
      ],
    );
  }
}
