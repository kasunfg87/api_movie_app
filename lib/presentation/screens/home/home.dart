import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/dashboard/dashboard.dart';
import 'package:movie_app/presentation/screens/discover/discover.dart';
import 'package:movie_app/presentation/screens/favourite/favourite.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/end_points.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  static String routeName = "/home";

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false)
        .getMovies(nowPlayingMovieEndPoint);

    Provider.of<MovieProvider>(context, listen: false)
        .getGenreList(genreEndPoint);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const Dashboard(),
    const DiscoverScreen(),
    const FavouriteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: kBlack.withOpacity(0.3),
          bottomNavigationBar: SalomonBottomBar(
              selectedItemColor: kOrange,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              items: [
                SalomonBottomBarItem(
                    icon: const Icon(
                      FlutterRemix.home_fill,
                      size: 28,
                    ),
                    title: const CustomTextLatoSmall(text: 'Home')),
                SalomonBottomBarItem(
                    icon: const Icon(
                      FlutterRemix.search_fill,
                      size: 28,
                    ),
                    title: const CustomTextLatoSmall(text: 'Discover')),
                SalomonBottomBarItem(
                    icon: const Icon(
                      FlutterRemix.heart_2_fill,
                      size: 28,
                    ),
                    title: const CustomTextLatoSmall(text: 'Favourite')),
              ]),
          body: screens[currentIndex],
        ));
  }
}
