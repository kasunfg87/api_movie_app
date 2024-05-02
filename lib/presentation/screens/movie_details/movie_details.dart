import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/cast_widget.dart';
import 'package:movie_app/presentation/widgets/custom_back_button.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/movie_header.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:movie_app/presentation/widgets/review_widget.dart';
import 'package:movie_app/presentation/widgets/synopsis.dart';
import 'package:movie_app/presentation/widgets/thumbnail_image.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  static String routeName = "/details";

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
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(),
                      SizedBox(
                        height: SizeConfig.h(context) * 0.30,
                      ),
                      Column(
                        children: [
                          MovieHeader(
                            movieModel: value.movieModel,
                          ),
                          Synopsis(
                              movieSynopsis:
                                  value.movieModel.overview.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          ReletedMovie(
                            movieId: value.movieModel.id.toString(),
                          ),
                          CastAndCrew(movieId: value.movieModel.id.toString()),
                          const ReviewWidget()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
