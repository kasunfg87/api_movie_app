import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/movie_genre.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:movie_app/presentation/widgets/thumbnail_image.dart';
import 'package:readmore/readmore.dart';
import 'package:styled_divider/styled_divider.dart';

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
          Container(
            height: double.infinity,
            color: kBlack,
          ),
          const ThumbnailImage(
            networkImage:
                'https://lumiere-a.akamaihd.net/v1/images/image_b81e5aed.jpeg',
          ),
          const GradientBackground(),
          Positioned(
              top: SizeConfig.h(context) * 0.35,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextLatoSmall(
                      text: 'Star Wars: The Last Jedi',
                      fontSize: 24,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              height: 25,
                              AssetConstant.timer,
                              // ignore: deprecated_member_use
                              color: kWhite,
                            ),
                            const CustomTextLatoSmall(text: '152 minutes')
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomTextLatoSmall(text: '7.0 (IMDb)')
                          ],
                        ),
                      ],
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
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextLatoSmall(
                              text: 'Release date',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomTextLatoSmall(
                              text: 'December 9, 2017',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextLatoSmall(
                              text: 'Genre',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            GenreButton(
                              movieGenre: 'Action',
                              onTap: () {},
                            )
                          ],
                        ),
                      ],
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
                      height: 16,
                    ),
                    const CustomTextLatoSmall(
                      text: 'Synopsis',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: SizeConfig.w(context) * 0.95,
                        child: ReadMoreText(
                          'Jedi Master-in-hiding Luke Skywalker unwillingly attempts to guide young hopeful Rey in the ways of the force, while Leia, former princess turned general, attempts to lead what is left of the Resistance away from the ruthless tyrannical grip of the First Order.',
                          trimLines: 4,
                          style: GoogleFonts.lato(color: kWhite),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Readmore',
                          trimExpandedText: 'Readless',
                          moreStyle: GoogleFonts.lato(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: kWhite),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextLatoSmall(
                      text: 'Related Movies',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const RelatedMovie(
                      movieImage:
                          'https://hd.wallpaperswide.com/thumbs/star_wars_the_last_jedi-t2.jpg',
                      movieTitle: '',
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
