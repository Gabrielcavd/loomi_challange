import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:video_player/video_player.dart';

class MovieProgressIndicator extends StatelessWidget {
  const MovieProgressIndicator({super.key, required this.videoController});
  final VideoPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 8,
            right: 8,
            child: VideoProgressIndicator(
              videoController,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: AppTheme.lightPurple,
                backgroundColor: AppTheme.darkGrey2,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: videoController,
            builder: (context, value, child) => Positioned(
              left: (value.position.inMicroseconds /
                          value.duration.inMicroseconds) *
                      MediaQuery.of(context).size.width -
                  3,
              bottom: 8,
              child: const CircularIcon(),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: AppTheme.lightPurple,
        shape: BoxShape.circle,
      ),
    );
  }
}
