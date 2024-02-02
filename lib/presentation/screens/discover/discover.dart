import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_category_button.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

int selectdIndex = 0;

TextEditingController textController = TextEditingController();

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlack,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
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
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 30,
                    width: SizeConfig.w(context),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectdIndex = index;
                            });
                          },
                          child: CategoryTextButton(
                            buttonText: AssetConstant.movieCategory[index],
                            isSelected: selectdIndex == index ? true : false,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 24,
                      ),
                      itemCount: AssetConstant.movieCategory.length,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: SizeConfig.h(context) * 0.6,
                    width: SizeConfig.w(context),
                    child: MasonryGridView.builder(
                      itemCount: AssetConstant.moviePoster.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(6),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: AppColors.kGray,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      AssetConstant.moviePoster[index])),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Aquaman and the Lost Kingdom',
                                style:
                                    GoogleFonts.lato(color: AppColors.kWhite),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
