import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/dashboard/dashboard.dart';
import 'package:movie_app/presentation/screens/discover/discover.dart';
import 'package:movie_app/presentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/end_points.dart';
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
        .getMovies(popularMovieEndPoint);

    Provider.of<MovieProvider>(context, listen: false)
        .getGenreList(genreEndPoint);
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
    const MovieDetails()
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
                  icon: const FaIcon(FontAwesomeIcons.houseUser),
                  title: Text(
                    "Home",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const FaIcon(FontAwesomeIcons.film),
                  title: Text(
                    "Discover",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  title: Text(
                    "Profile",
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ]),
          body: screens[currentIndex],
        ));
  }
}
