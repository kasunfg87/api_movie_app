import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:readmore/readmore.dart';

class Biography extends StatelessWidget {
  const Biography({
    super.key,
    required this.movieBiography,
  });
  final String movieBiography;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextLatoSmall(
            text: 'Biography',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: SizeConfig.w(context) * 0.95,
              child: ReadMoreText(
                textAlign: TextAlign.justify,
                movieBiography,
                trimLines: 13,
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
