import 'package:flutter/material.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class MovieResume extends StatelessWidget {
  const MovieResume({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.genre,
            style: AppTextStyles.textStyle(
              fontSize: 14,
              color: AppTheme.palleteWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            movie.name,
            style: AppTextStyles.textStyle(
              fontSize: 24,
              color: AppTheme.palleteWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: width * 0.8,
            child: Text(
              movie.synopsis,
              style: AppTextStyles.textStyle(
                fontSize: 14,
                color: AppTheme.palleteWhite,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
