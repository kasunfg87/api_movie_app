import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: AppColors.kBlack,
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
                  borderRadius: BorderRadius.circular(30)),
            ),
            const SizedBox(
              height: 36,
            ),
            const CustomTextLato(text01: '', text02: 'Trending'),
            const SizedBox(
              height: 36,
            ),
            CarouselSlider.builder(
                itemCount: 10,
                itemBuilder: (context, index, realIndex) => Container(
                      color: AppColors.kOrange,
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
