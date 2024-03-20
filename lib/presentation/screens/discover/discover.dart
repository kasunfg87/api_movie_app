import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/data/remote/secret.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/end_points.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_category_button.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato.dart';
import 'package:provider/provider.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  static String routeName = "/discover";

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

int selectdIndex = 0;

TextEditingController textController = TextEditingController();

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
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
                  Consumer<MovieProvider>(
                    builder: (context, value, child) {
                      return StandardSearchBar(
                        onChanged: (input) {
                          value.searchMovies(input);
                        },
                        borderRadius: 25,
                        suggestionTextStyle: GoogleFonts.lato(color: kWhite),
                        textStyle: GoogleFonts.lato(color: kWhite),
                        backgroundColor: kGray,
                        width: 360,
                      );
                    },
                  ),
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
                        return Consumer<MovieProvider>(
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectdIndex = index;
                                });

                                value.getMovies(
                                    '$movieByGenreEndPoint${value.genres[index].id}&$apiKey');
                              },
                              child: CategoryTextButton(
                                buttonText: value.genres[index].name.toString(),
                                isSelected:
                                    selectdIndex == index ? true : false,
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 24,
                      ),
                      itemCount:
                          Provider.of<MovieProvider>(context).genres.length,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      height: SizeConfig.h(context) * 0.6,
                      width: SizeConfig.w(context),
                      child: Consumer<MovieProvider>(
                        builder: (context, value, child) {
                          return MasonryGridView.builder(
                              itemCount: value.movies.length,
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Provider.of<MovieProvider>(context,
                                              listen: false)
                                          .setMovie(value.movies[index]);

                                      Provider.of<MovieProvider>(context,
                                              listen: false)
                                          .getSimilarMovies(
                                              similarMovieEndPoint1stHalf +
                                                  value.movies[index].id
                                                      .toString() +
                                                  similarMovieEndPoint2ndHalf);

                                      Provider.of<MovieProvider>(context,
                                              listen: false)
                                          .getCastList(castEndPoint1stpart +
                                              value.movies[index].id
                                                  .toString() +
                                              castEndPoint2ndpart);

                                      Navigator.pushNamed(
                                          context, MovieDetails.routeName);
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.all(6),
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: kGray,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            // value.movies[index].posterPath != null
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  'https://image.tmdb.org/t/p/w500${value.movies[index].posterPath}',
                                                  frameBuilder: (context,
                                                      child,
                                                      frame,
                                                      wasSynchronouslyLoaded) {
                                                    return child;
                                                  },
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    } else {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                )),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              value.movies[index]
                                                          .originalName !=
                                                      null
                                                  ? value.movies[index]
                                                      .originalName
                                                      .toString()
                                                  : value.movies[index]
                                                      .originalTitle
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  color: kWhite),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        )));
                              });
                        },
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
