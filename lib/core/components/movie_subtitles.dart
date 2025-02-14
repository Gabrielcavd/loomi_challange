import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/modules/watch_movie/controllers/watch_movie_controller.dart';

class MovieSubtitles extends StatelessWidget {
  const MovieSubtitles({super.key, required this.controller});
  final WatchMovieController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      height: size.height,
      width: size.width,
      color: AppTheme.darkGreyPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              controller.showSubtitles.toggle();
            },
            child: Text(
              "Close",
              style: AppTextStyles.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightPurple),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubtitleSecction(
                title: "Audio",
                options: List.generate(
                  controller.audioOptions.length,
                  (index) => SubtitleOption(
                    title: controller.audioOptions[index].title,
                    isSelected: controller.audioOptions[index].isSelected,
                    onTap: () {
                      controller.changeAudio(index);
                    },
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.4),
              SubtitleSecction(
                title: "Subtitles",
                options: List.generate(
                  controller.subtitleOptions.length,
                  (index) => SubtitleOption(
                    title: controller.subtitleOptions[index].title,
                    isSelected: controller.subtitleOptions[index].isSelected,
                    onTap: () {
                      controller.changeSubtitle(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SubtitleSecction extends StatelessWidget {
  const SubtitleSecction(
      {super.key, required this.title, required this.options});
  final String title;
  final List<SubtitleOption> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.labelTextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        ...options,
      ],
    );
  }
}

class SubtitleOption extends StatelessWidget {
  const SubtitleOption(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  final bool isSelected;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color:
              isSelected ? AppTheme.purplePrimary.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppTextStyles.textStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppTheme.lightPurple : AppTheme.palleteGrey2,
          ),
        ),
      ),
    );
  }
}
