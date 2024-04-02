import 'package:age_calculator/age_calculator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/biography.dart';
import 'package:movie_app/presentation/widgets/blur_tumbnail_image.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/info_header.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

class CastBiography extends StatefulWidget {
  const CastBiography({
    super.key,
  });

  static String routeName = "/cast_biography";

  @override
  State<CastBiography> createState() => _CastBiographyState();
}

class _CastBiographyState extends State<CastBiography> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
        builder: (context, value, child) => value.castBiography.isNotEmpty
            ? Scaffold(
                backgroundColor: kBlack,
                body: FadeInRight(
                  child: Stack(
                    children: [
                      BlurThumbnailImage(
                        networkImage:
                            'https://image.tmdb.org/t/p/w500${value.castBiography[0].profilePath.toString()}',
                      ),
                      const GradientBackground(),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding:
                            const EdgeInsets.only(left: 18, right: 18, top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const CustomBackButton(),
                            SizedBox(
                              height: SizeConfig.h(context) * 0.30,
                              width: SizeConfig.w(context),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInRight(
                                      child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${value.castBiography[0].profilePath.toString()}'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InfoHeader(
                                    knownFor: value
                                        .castBiography[0].knownForDepartment
                                        .toString(),
                                    knownCredits: value
                                        .castBiography[0].popularity
                                        .toString(),
                                    gender: int.parse(value
                                                .castBiography[0].gender
                                                .toString()) ==
                                            1
                                        ? 'Female'
                                        : 'Male'.toString(),
                                    birthDay:
                                        '${value.castBiography[0].birthday.toString()} (${AgeCalculator.age(DateTime.parse(value.castBiography[0].birthday.toString())).years})',
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextLatoSmall(
                                      text: value.castBiography[0].name
                                          .toString(),
                                      fontSize: 24,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.w(context) * 0.9,
                                      child: const StyledDivider(
                                        color: kWhite,
                                        height: 15,
                                        thickness: 0.20,
                                        lineStyle: DividerLineStyle.solid,
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                Biography(
                                    movieBiography: value
                                        .castBiography[0].biography
                                        .toString()),
                                const SizedBox(
                                  height: 20,
                                ),
                                ReletedMovie(
                                  movieId: value.movieModel.id.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            : const Center(child: CircularProgressIndicator()));
  }
}
