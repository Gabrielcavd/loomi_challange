import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatelessWidget {
  const MoviePlayer(
      {super.key,
      required this.videoController,
      this.blurMovie = false,
      required this.zoom});
  final VideoPlayerController videoController;
  final bool blurMovie;
  final double zoom;
  @override
  Widget build(BuildContext context) {
    final Size size = videoController.value.size;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
            child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: size.width * zoom,
                        height: size.height * zoom,
                        child: VideoPlayer(videoController))))),
        if (blurMovie)
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
      ],
    );
  }
}
