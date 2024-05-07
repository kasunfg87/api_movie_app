import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/known_for_tile.dart';
import 'package:provider/provider.dart';

class KnownForMovie extends StatefulWidget {
  const KnownForMovie({
    super.key,
  });

  @override
  State<KnownForMovie> createState() => _KnownForMovieState();
}

class _KnownForMovieState extends State<KnownForMovie> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: value.knownFor.isNotEmpty
              ? [
                  const CustomTextLatoSmall(
                    text: 'Known For',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CarouselSlider.builder(
                    itemCount: value.knownFor.length,
                    itemBuilder: (context, index, realIndex) {
                      return FadeInRight(
                        child: InkWell(
                          onTap: () {
                            Provider.of<MovieProvider>(context, listen: false)
                                .initializeMovie(value.knownFor[index]);

                            Navigator.pushNamed(
                                context, MovieDetails.routeName);
                          },
                          child: KnownForTile(
                            movieImage:
                                'https://image.tmdb.org/t/p/w500${value.knownFor[index].posterPath}',
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        autoPlayCurve: Curves.linear,
                        viewportFraction: 0.33,
                        pageSnapping: true,
                        scrollPhysics: const BouncingScrollPhysics()),
                  )
                ]
              : [],
        );
      },
    );
  }
}
