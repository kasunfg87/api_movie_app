import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:readmore/readmore.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({
    super.key,
    required this.movieSynopsis,
  });
  final String movieSynopsis;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                textAlign: TextAlign.justify,
                movieSynopsis,
                trimLines: 4,
                style: GoogleFonts.lato(color: kWhite),
                trimMode: TrimMode.Line,
                trimCollapsedText: '..Readmore',
                trimExpandedText: '..Readless',
                moreStyle:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle: GoogleFonts.lato(
                    fontSize: 14, fontWeight: FontWeight.w800, color: kWhite),
              )),
        ],
      ),
    );
  }
}
