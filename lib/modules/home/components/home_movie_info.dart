import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/modules/home/components/home_movie_comments.dart';
import 'package:loomi_challange/modules/home/components/home_movie_interactions.dart';
import 'package:loomi_challange/modules/home/components/home_movie_resume.dart';

class HomeMovieInfo extends StatelessWidget {
  const HomeMovieInfo({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieResume(movie: movie),
        const SizedBox(height: 20),
        const MovieComments(),
        const SizedBox(height: 40),
        Center(
          child: AppButton(
            onPressed: () {},
            width: 205,
            transparentButton: true,
            text: "Watch",
          ),
        ),
        Divider(
          color: AppTheme.palleteGrey.shade700,
          thickness: 0.8,
        ),
        MovieInteract(
          movie: movie,
        ),
      ],
    );
  }
}
