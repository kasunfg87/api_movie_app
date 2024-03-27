import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/presentation/widgets/biography.dart';
import 'package:movie_app/presentation/widgets/blur_tumbnail_image.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/gradient_backgrount.dart';
import 'package:movie_app/presentation/widgets/personal_details.dart';
import 'package:movie_app/presentation/widgets/releted_movie.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

class CastBiography extends StatefulWidget {
  const CastBiography({super.key});

  static String routeName = "/cast_biography";

  @override
  State<CastBiography> createState() => _CastBiographyState();
}

class _CastBiographyState extends State<CastBiography> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
        body: Consumer<MovieProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                const BlurThumbnailImage(
                  networkImage:
                      'https://media.themoviedb.org/t/p/w600_and_h900_bestv2/btORQRDyGCF0KNweGGYpmQXZK3P.jpg',
                ),
                const GradientBackground(),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const CustomBackButton(),
                      SizedBox(
                        height: SizeConfig.h(context) * 0.30,
                        width: SizeConfig.w(context),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  'https://media.themoviedb.org/t/p/w600_and_h900_bestv2/btORQRDyGCF0KNweGGYpmQXZK3P.jpg'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextLatoSmall(
                                  text: 'Personal Info',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: SizeConfig.w(context) / 2.5,
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
                                  height: 10,
                                ),
                                const PersonalDetails(
                                  headerText: 'Known For',
                                  detailsText: 'Acting',
                                ),
                                const PersonalDetails(
                                  headerText: 'Known Credits',
                                  detailsText: '116',
                                ),
                                const PersonalDetails(
                                  headerText: 'Gender',
                                  detailsText: 'Male',
                                ),
                                const PersonalDetails(
                                  headerText: 'Birthday',
                                  detailsText: 'December 19, 1980 ',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTextLatoSmall(
                                text: 'Jake Gyllenhaal',
                                fontSize: 24,
                              ),
                              const SizedBox(
                                height: 8,
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
                                height: 10,
                              ),
                            ],
                          ),
                          const Biography(
                              movieBiography:
                                  "Jacob Benjamin Gyllenhaal (born December 19, 1980) is an American actor and producer. Born into the Gyllenhaal family, he is the son of director Stephen Gyllenhaal and screenwriter Naomi Foner; his older sister is actress Maggie Gyllenhaal.\n\n   He began acting as a child, making his acting debut in City Slickers (1991), followed by roles in his father's films A Dangerous Woman (1993) and Homegrown (1998). His breakthrough roles were as Homer Hickam in October Sky (1999) and as a psychologically troubled teenager in Donnie Darko (2001). In 2004, Gyllenhaal starred in the science fiction disaster film The Day After Tomorrow. In 2005, he played Jack Twist in Ang Lee's romantic drama Brokeback Mountain, for which Gyllenhaal won a BAFTA Award and was nominated for an Academy Award. His career progressed with starring roles in the thriller Zodiac (2007), the romantic comedy Love & Other Drugs (2010), and the science fiction film Source Code (2011). Further acclaim came with his roles in Denis Villeneuve's thrillers Prisoners (2013) and Enemy (2013), and he received nominations for the BAFTA Award for Best Actor in a Leading Role for his performances as a manipulative journalist in Nightcrawler (2014) and a troubled writer in Nocturnal Animals (2016). His highest-grossing release came with the Marvel Cinematic Universe superhero film Spider-Man: Far From Home (2019), in which he portrayed Quentin Beck / Mysterio. Gyllenhaal has also performed on stage, starring in Broadway productions of the musical Sunday in the Park with George as well as the plays Constellations and Sea Wall/A Life, the lattermost of which earned him a Tony Award nomination. Aside from acting, he is vocal about political and social issues. Description above from the Wikipedia article Jake Gyllenhaal, licensed under CC-BY-SA, full list of contributors on Wikipedia."),
                          const SizedBox(
                            height: 20,
                          ),
                          ReletedMovie(
                            movieId: value.movieModel.id.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
