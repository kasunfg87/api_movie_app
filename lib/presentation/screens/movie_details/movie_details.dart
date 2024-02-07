import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:styled_divider/styled_divider.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: kBlack,
          ),
          Image.network(
            'https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png',
            width: double.infinity,
            height: SizeConfig.h(context) * 0.7,
            fit: BoxFit.cover,
          ),
          const Positioned.fill(
              child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Color.fromARGB(246, 0, 3, 17)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.6])),
          )),
          Positioned(
              top: SizeConfig.h(context) * 0.5,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextLatoSmall(
                      text: 'Star Wars: The Last Jedi',
                      fontSize: 24,
                    ),
                    const SizedBox(
                      height: 10,
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
                          width: 20,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomTextLatoSmall(text: '7.0 (IMDb)')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.w(context) * 0.9,
                      child: const StyledDivider(
                        color: kWhite,
                        height: 50,
                        thickness: 0.20,
                        lineStyle: DividerLineStyle.solid,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextLatoSmall(
                              text: 'Release date',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomTextLatoSmall(
                              text: 'December 9, 2017',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextLatoSmall(
                              text: 'Genre',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: kWhite, width: 0.5)),
                                child:
                                    const CustomTextLatoSmall(text: 'Action'))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
