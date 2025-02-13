import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WatchMoviePlayer extends StatelessWidget {
  const WatchMoviePlayer({super.key, required this.videoController});
  final VideoPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: videoController.value.size.height,
          width: videoController.value.size.width,
          child: AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: VideoPlayer(
              videoController,
            ),
          ),
        ),
      ),
    );
  }
}
