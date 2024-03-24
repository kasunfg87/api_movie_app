import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerDialog {
  static Future openDialog(BuildContext context, String movieId) => showDialog(
        context: context,
        builder: (context) => ZoomIn(
            child: Container(
          height: 200,
          width: SizeConfig.w(context),
          child: YoutubePlayer(
              controller: Provider.of<MovieProvider>(context).controller),
        )),
      );
}
