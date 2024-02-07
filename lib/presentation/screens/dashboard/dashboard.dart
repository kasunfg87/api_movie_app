import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            CarouselSlider.builder(
                itemCount: AssetConstant.moviePoster.length,
                itemBuilder: (context, index, realIndex) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kOrange,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(AssetConstant.moviePoster[index])),
                      ),
                    ),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  viewportFraction: 0.55,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                )),
          ]),
        ),
      ),
    );
  }
}
