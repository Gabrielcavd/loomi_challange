import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class MovieComments extends StatelessWidget {
  const MovieComments({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${Routes.home}${Routes.movieComments}");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comments: 1.322",
              style: AppTextStyles.textStyle(
                fontSize: 12,
                color: AppTheme.palleteWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppTheme.palleteGrey,
                  radius: 8,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consect",
                  style: AppTextStyles.textStyle(
                      fontSize: 12, color: AppTheme.palleteWhite.shade600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
