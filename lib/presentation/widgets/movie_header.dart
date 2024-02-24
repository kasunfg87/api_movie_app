import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/movie_genre.dart';
import 'package:styled_divider/styled_divider.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movieTilte,
    required this.movietime,
    required this.movieRating,
    required this.movieReleaseDate,
    required this.movieGenre,
  });
  final String movieTilte, movietime, movieRating, movieReleaseDate;
  final List<String> movieGenre;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLatoSmall(
          text: movieTilte,
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
                CustomTextLatoSmall(text: movietime)
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomTextLatoSmall(text: movieRating)
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextLatoSmall(
                  text: 'Release date',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextLatoSmall(
                  text: movieReleaseDate,
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
                SizedBox(
                  width: SizeConfig.w(context) * 0.525,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        movieGenre.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: GenreButton(
                            movieGenre: movieGenre[index],
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
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
      ],
    );
  }
}
