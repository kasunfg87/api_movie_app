import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerDialog {
  static Future openDialog(BuildContext context, String movieId) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => ZoomIn(
            child: SizedBox(
          height: SizeConfig.h(context),
          child: Stack(
            children: [
              Positioned(
                top: 90,
                child: SizedBox(
                  height: SizeConfig.h(context) * 0.30,
                  child: YoutubePlayer(
                    controller: Provider.of<MovieProvider>(context).controller,
                  ),
                ),
              ),
            ],
          ),
        )),
      );
}
