import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/modules/watch_movie/controllers/watch_movie_controller.dart';

class MovieCommands extends StatelessWidget {
  const MovieCommands({super.key, required this.controller});
  final WatchMovieController controller;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Container(
        alignment: Alignment.center,
        color: Colors.black26,
        height: controller.videoController.value.size.height,
        width: controller.videoController.value.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                controller.videoController.seekTo(
                  controller.videoController.value.position -
                      const Duration(seconds: 15),
                );
              },
              child: CustomIcons.back_video(
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(width: 50),
            InkWell(
                onTap: controller.changeMovieStatus,
                child: Obx(
                  () => controller.movieIsPlaying.value == VideoStatus.playing
                      ? const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 80,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 90,
                        ),
                )),
            const SizedBox(width: 50),
            InkWell(
              onTap: () {
                controller.videoController.seekTo(
                  controller.videoController.value.position +
                      const Duration(seconds: 15),
                );
              },
              child: CustomIcons.advance_video(
                height: 60,
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
