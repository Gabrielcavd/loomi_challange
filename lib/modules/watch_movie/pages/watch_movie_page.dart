import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/movie_subtitles.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/watch_movie/components/movie_commands.dart';
import 'package:loomi_challange/modules/watch_movie/components/movie_comments.dart';
import 'package:loomi_challange/modules/watch_movie/components/movie_progress_indicator.dart';
import 'package:loomi_challange/modules/watch_movie/components/watch_movie_player.dart';
import 'package:loomi_challange/modules/watch_movie/controllers/watch_movie_controller.dart';

class WatchMoviePage extends StatelessWidget {
  const WatchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WatchMovieController controller =
        getDependency.get<WatchMovieController>(context);
    final videoController = controller.videoController;

    return PopScope(
      onPopInvoked: (didPop) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      },
      child: Obx(
        () => PageBase(
          enableAppBar: controller.showInterface.value,
          extendBody: true,
          centerTitle: false,
          title: controller.movie.name,
          endDrawer: CommentsDrawer(
            controller: controller,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.showSubtitles.toggle();
                    controller.showInterface.toggle();
                  },
                  child: CustomIcons.subtitle(),
                ),
                const SizedBox(width: 5),
                Text(
                  'Subtitles / audio',
                  style: AppTextStyles.textStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.palleteWhite),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: CustomIcons.comment(),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Comments 324',
                  style: AppTextStyles.textStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.palleteWhite),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: controller.showSubtitles.value
                ? null
                : () {
                    controller.toggleInterface();
                  },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Obx(
                  () => controller.videoIsLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.lightPurple,
                            ),
                          ),
                        )
                      : WatchMoviePlayer(videoController: videoController),
                ),
                Obx(
                  () => !controller.showInterface.value
                      ? const SizedBox()
                      : MovieCommands(
                          controller: controller,
                        ),
                ),
                Obx(
                  () => controller.videoIsLoading.value ||
                          !controller.showInterface.value
                      ? const SizedBox()
                      : MovieProgressIndicator(
                          videoController: videoController),
                ),
                Obx(
                  () => controller.showSubtitles.value
                      ? MovieSubtitles(
                          controller: controller,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
