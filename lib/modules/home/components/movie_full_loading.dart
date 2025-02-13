import 'package:flutter/material.dart';
import 'package:loomi_challange/modules/home/components/home_movie_info_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_loading.dart';

class MovieFullLoading extends StatelessWidget {
  const MovieFullLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MovieLoading(),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: HomeMovieInfoLoading(),
        ),
      ],
    );
  }
}
