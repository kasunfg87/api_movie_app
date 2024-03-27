import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_playtrailer_button.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/movie_genre.dart';
import 'package:styled_divider/styled_divider.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLatoSmall(
          text: movieModel.title.toString(),
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
                CustomTextLatoSmall(
                    text:
                        '${movieModel.voteAverage!.toStringAsFixed(1)} (IMDB)')
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const PlayTrailerButton(),
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
                  text: DateFormat.yMMMMd('en_US').format(
                      DateTime.parse(movieModel.releaseDate.toString())),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextLatoSmall(
                    text: 'Genre',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        movieModel.genreIds!.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: GenreButton(
                            movieGenre: AssetConstant.getGenreByIndex(
                                movieModel.genreIds![index].toInt()),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
