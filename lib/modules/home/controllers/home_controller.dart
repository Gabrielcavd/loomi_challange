import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/home/components/home_movie_background.dart';
import 'package:loomi_challange/modules/home/repositories/home_repository.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  HomeController(this._homeRepository);
  final HomeRepository _homeRepository;

  final RxList<Movie> movies = <Movie>[].obs;
  late User? user;

  final state = HomeState.loading.obs;
  final videoState = HomeState.loading.obs;
  final gradientState = HomeState.loading.obs;
  LinearGradient? backGroundGradient;
  RxBool imageMovieLoading = true.obs;

  final PageController pageController = PageController();
  late final VideoPlayerController? videoController;

  @override
  void onInit() async {
    super.onInit();
    user = _homeRepository.firebaseAuthService.firebaseAuth.currentUser;
    await initializeDateFormatting();
    await getMovies();
    generateBackground(0);

    initializeVideoController(0);
  }

  @override
  void dispose() {
    super.dispose();
    videoController!.dispose();
  }

  void watchMovie(BuildContext context, Movie movie) {
    Navigator.pushNamed(context, Routes.watchMovie, arguments: movie).then(
      (value) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      },
    );
  }

  Future<void> initializeVideoController(int index) async {
    videoController =
        VideoPlayerController.networkUrl(Uri.parse(movies[index].streamLink))
          ..initialize().then((_) {
            videoController!.setVolume(0);
            videoController!.play();
            videoController!.setLooping(true);
          });

    Future.delayed(const Duration(seconds: 10), () {
      videoState.value = HomeState.done;
    });
  }

  Future<void> onPageChanged(int index) async {
    videoState.value = HomeState.loading;
    await videoController!.pause();
    generateBackground(index);

    Future.delayed(const Duration(seconds: 10), () async {
      videoState.value = HomeState.done;
    });
  }

  void generateBackground(int index) async {
    gradientState.value = HomeState.loading;
    backGroundGradient = await generateGradient(movies[index].poster.url);
    gradientState.value = HomeState.done;
  }

  Future<void> getMovies() async {
    try {
      state.value = HomeState.loading;

      movies.assignAll(await _homeRepository.getMovies());

      state.value = HomeState.done;
    } catch (e) {
      state.value = HomeState.error;
      rethrow;
    }
  }
}

enum HomeState { loading, done, error }
