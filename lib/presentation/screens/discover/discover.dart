import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

TextEditingController textController = TextEditingController();

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlack,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextLato(
                  text01: '',
                  text02: 'Find Movies, Tv series,\n and more..',
                ),
                const SizedBox(
                  height: 20,
                ),
                StandardSearchBar(
                    borderRadius: 25,
                    suggestionTextStyle:
                        GoogleFonts.lato(color: AppColors.kWhite),
                    textStyle: GoogleFonts.lato(color: AppColors.kWhite),
                    backgroundColor: AppColors.kGray,
                    width: 360,
                    suggestions: AssetConstant.moviePoster),
              ],
            ),
          ),
        ));
  }
}
