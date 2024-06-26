import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/end_points.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false)
        .getMovies(popularMovieEndPoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            const CustomTextLato(
              text01: 'Stream ',
              text02: 'Everywhere',
              multiColor: true,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: SizeConfig.w(context),
              height: 190,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetConstant.mainBanner)),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 8),
                    height: 62,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite.withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kOrange),
                          child: SvgPicture.asset(
                            AssetConstant.playIcon,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextLato(
                              text01: '',
                              text02: 'Continue Watching',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            CustomTextLato(
                              text01: '',
                              text02: 'Ready Player one',
                              fontSize: 16,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const CustomTextLato(text01: '', text02: 'Trending'),
            const SizedBox(
              height: 36,
            ),
            Consumer<MovieProvider>(
              builder: (context, value, child) {
                return CarouselSlider.builder(
                    itemCount: value.movies.isEmpty ? 0 : value.movies.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: () {
                          //-- initiate movie

                          Provider.of<MovieProvider>(context, listen: false)
                              .initializeMovie(value.movies[index]);

                          //-- navigate to details screen

                          Navigator.pushNamed(context, MovieDetails.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kGray,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${value.movies[index].posterPath}')),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 370,
                      autoPlay: true,
                      autoPlayCurve: Curves.linearToEaseOut,
                      viewportFraction: 0.58,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      enableInfiniteScroll: true,
                    ));
              },
            )
          ]),
        ),
      ),
    );
  }
}
