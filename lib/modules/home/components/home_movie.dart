import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/modules/home/components/home_movie_info.dart';
import 'package:loomi_challange/modules/home/components/home_movie_info_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_full_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_player.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';
import 'package:video_player/video_player.dart';

class HomeMovie extends StatefulWidget {
  const HomeMovie({super.key, required this.movie, required this.controller});
  final Movie movie;
  final HomeController controller;

  @override
  State<HomeMovie> createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.77,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: Obx(
              () => widget.controller.videoState.value == HomeState.done
                  ? MoviePlayer(
                      videoController: widget.controller.videoController!,
                      zoom: 1.25,
                    )
                  : FadeInImage.assetNetwork(
                      placeholder: "assets/images/loading_image.png",
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const MovieLoading(),
                      image: widget.movie.poster.url,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Container(
            width: width,
            height: height * 0.77,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.5, 1.0],
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.5),
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeMovieInfo(
              movie: widget.movie,
            ),
          ),
        ],
      ),
    );
  }
}
