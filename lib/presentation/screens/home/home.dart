import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants/asset_constant.dart';
import 'package:movie_app/presentation/screens/dashboard/dashboard.dart';
import 'package:movie_app/presentation/screens/discover/discover.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:movie_app/utils/bnb_custom_point.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const Dashboard(),
    const DiscoverScreen(),
    const MovieDetails()
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: kBlack,
          bottomNavigationBar: SizedBox(
            height: 100,
            width: SizeConfig.w(context),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(SizeConfig.w(context), 100),
                  painter: BNBCustomPainter(),
                ),
                Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        shape: const CircleBorder(),
                        backgroundColor: kOrange,
                        elevation: 2,
                        child: SvgPicture.asset(AssetConstant.playIcon),
                        onPressed: () {
                          setBottomBarIndex(1);
                        })),
                Positioned(
                  top: 20,
                  left: SizeConfig.w(context) * 0.15,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      AssetConstant.homeIcon,
                      // ignore: deprecated_member_use
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    splashColor: kOrange,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: SizeConfig.w(context) * 0.15,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      AssetConstant.profileIcon,
                      // ignore: deprecated_member_use
                    ),
                    onPressed: () {
                      setBottomBarIndex(2);
                    },
                    splashColor: kOrange,
                  ),
                ),
              ],
            ),
          ),
          body: screens[currentIndex],
        ));
  }
}
