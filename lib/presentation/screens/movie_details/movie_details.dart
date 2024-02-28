import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/movie_header.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:movie_app/presentation/widgets/synopsis.dart';
import 'package:movie_app/presentation/widgets/thumbnail_image.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<MovieProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                ThumbnailImage(
                  networkImage: value.movieModel.posterPath.toString(),
                ),
                const GradientBackground(),
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: SizeConfig.h(context) * 0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieHeader(
                        movieTilte: value.movieModel.originalTitle.toString(),
                        movietime: "152 minutes",
                        movieRating:
                            '${value.movieModel.voteAverage!.toStringAsFixed(1)} (IMDB)',
                        movieReleaseDate: DateFormat.yMMMMd('en_US')
                            .format(DateTime.parse(
                                value.movieModel.releaseDate.toString()))
                            .toString(),
                        movieGenre: value.movieModel.genreIds!.toList(),
                      ),
                      Synopsis(
                          movieSynopsis: value.movieModel.overview.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      const ReletedMovie(),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
