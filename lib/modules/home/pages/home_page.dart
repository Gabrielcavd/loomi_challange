import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/home/components/home_movie.dart';
import 'package:loomi_challange/modules/home/components/home_movie_info_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_full_loading.dart';
import 'package:loomi_challange/modules/home/components/movie_player.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';
import 'package:loomi_challange/modules/home/controllers/profile_icon.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        getDependency.get<HomeController>(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: PageBase(
        body: Stack(
          children: [
            Obx(() => controller.videoState.value == HomeState.done
                ? MoviePlayer(
                    videoController: controller.videoController!,
                    blurMovie: true,
                    zoom: 1.55,
                  )
                : const SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20),
                      Image.asset(
                        "assets/images/small_logo.png",
                        width: 32,
                      ),
                      ProfileIcon(controller: controller),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Now Showing',
                    style: AppTextStyles.headerTitleTextStyle(
                        fontSize: 21, color: AppTheme.palleteWhite),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => HomeState.loading == controller.state.value
                        ? const MovieFullLoading()
                        : SizedBox(
                            height: height * 0.77,
                            width: width,
                            child: HomeState.error == controller.state.value
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Error loading movies',
                                        style: AppTextStyles
                                            .headerSubtitleTextStyle(
                                                fontSize: 16,
                                                color: AppTheme.palleteWhite),
                                      ),
                                      const SizedBox(height: 10),
                                      IconButton(
                                        onPressed: () {
                                          controller.getMovies();
                                        },
                                        icon: const Icon(
                                          Icons.refresh,
                                          color: AppTheme.lightPurple,
                                        ),
                                      ),
                                    ],
                                  )
                                : PageView.builder(
                                    controller: controller.pageController,
                                    onPageChanged: (index) async {
                                      await controller.onPageChanged(index);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.movies.length,
                                    itemBuilder: (context, index) {
                                      Movie movie = controller.movies[index];
                                      return HomeMovie(
                                        movie: movie,
                                        controller: controller,
                                      );
                                    },
                                  ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
