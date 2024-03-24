import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_text_lato_small.dart';
import 'package:movie_app/presentation/widgets/player_dialog.dart';
import 'package:provider/provider.dart';

class PlayTrailerButton extends StatefulWidget {
  const PlayTrailerButton({
    super.key,
  });

  @override
  State<PlayTrailerButton> createState() => _PlayTrailerButtonState();
}

class _PlayTrailerButtonState extends State<PlayTrailerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kWhite,
      splashFactory: InkSplash.splashFactory,
      onTap: () {
        Provider.of<MovieProvider>(context, listen: false)
            .initYoutubeController('s_76M4c4LTo');
        PlayerDialog.openDialog(context, 'movieId');
      },
      child: Container(
        padding: const EdgeInsets.only(right: 12, left: 5, top: 1, bottom: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 0.1, style: BorderStyle.solid, color: kWhite)),
        child: Row(
          children: [
            const Icon(
              Icons.play_arrow,
              color: kOrange,
            ),
            const SizedBox(
              width: 5,
            ),
            CustomTextLatoSmall(
              text: 'Play Trailer',
              textColor: kWhite.withOpacity(0.8),
            )
          ],
        ),
      ),
    );
  }
}
