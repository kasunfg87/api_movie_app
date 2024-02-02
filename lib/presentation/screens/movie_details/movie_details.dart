import 'package:flutter/material.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';

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
            color: AppColors.kBlack,
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
        ],
      ),
    );
  }
}
