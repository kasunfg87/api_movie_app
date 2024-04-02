import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/cast_biography/cast_biography.dart';
import 'package:movie_app/presentation/widgets/cast_tile.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:provider/provider.dart';

class CastAndCrew extends StatefulWidget {
  const CastAndCrew({
    super.key,
    required this.movieId,
  });
  final String movieId;

  @override
  State<CastAndCrew> createState() => _CastAndCrewState();
}

class _CastAndCrewState extends State<CastAndCrew> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: value.cast.isNotEmpty
              ? [
                  const CustomTextLatoSmall(
                    text: 'Cast',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CarouselSlider.builder(
                    itemCount: value.cast.length,
                    itemBuilder: (context, index, realIndex) {
                      return FadeInRight(
                          child: InkWell(
                              onTap: () {
                                //--- get cast biography and image

                                Provider.of<MovieProvider>(context,
                                        listen: false)
                                    .getCastBiography(
                                        value.cast[index].id.toString());

                                //--- navigate to cast biography screen

                                Navigator.pushNamed(
                                    context, CastBiography.routeName);
                              },
                              child: CastTile(castModel: value.cast[index])));
                    },
                    options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        autoPlayCurve: Curves.linear,
                        viewportFraction: 0.30,
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
