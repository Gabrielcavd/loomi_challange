import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/data/domain/entities/movie_poster.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
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
  Rx<Widget> likeIcon = CustomIcons.like().obs;
  Rx<Widget> dislikeIcon = CustomIcons.dislike().obs;
  Rx<Widget> loveIcon = CustomIcons.loveIt().obs;
  LinearGradient? backGroundGradient;
  RxBool imageMovieLoading = true.obs;
  bool cancelMovieCounter = false;

  final PageController pageController = PageController();
  late final VideoPlayerController? videoController;

  @override
  void onInit() async {
    super.onInit();
    user = _homeRepository.firebaseAuthService.firebaseAuth.currentUser;
    await initializeDateFormatting();
    await getMovies();

    initializeVideoController(0);
  }

  @override
  void dispose() {
    super.dispose();
    videoController!.dispose();
  }

  void likeMovie() {
    likeIcon.value = CustomIcons.likeFill();
    dislikeIcon.value = CustomIcons.dislike();
    loveIcon.value = CustomIcons.loveIt();
  }

  void dislikeMovie() {
    likeIcon.value = CustomIcons.like();
    dislikeIcon.value = CustomIcons.dislikeFill();
    loveIcon.value = CustomIcons.loveIt();
  }

  void loveMovie() {
    likeIcon.value = CustomIcons.like();
    dislikeIcon.value = CustomIcons.dislike();
    loveIcon.value = CustomIcons.loveItFill();
  }

  void goToProfile(BuildContext context) {
    if (videoController != null) {
      videoController!.pause();
      videoState.value = HomeState.loading;
    }
    Navigator.pushNamed(context, Routes.profile).then((value) {
      Future.delayed(const Duration(seconds: 10), () {
        videoState.value = HomeState.done;
      });
    });
  }

  void watchMovie(BuildContext context, Movie movie) {
    // if (videoController != null && videoController!.value.isInitialized) {
    //   videoController!.pause();
    //   videoState.value = HomeState.loading;
    // }
    Navigator.pushNamed(context, Routes.watchMovie, arguments: movie).then(
      (value) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        Future.delayed(const Duration(seconds: 10), () {
          videoState.value = HomeState.done;
        });
      },
    );
  }

  Future<void> initializeVideoController(int index) async {
    try {
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
    } catch (e) {
      videoState.value = HomeState.done;
      debugPrint(e.toString());
    }
  }

  Future<void> onPageChanged(int index) async {
    videoState.value = HomeState.loading;
    cancelMovieCounter = true;
    await videoController!.pause();
    generateBackground(index);

    Future.delayed(const Duration(seconds: 10), () async {
      if (!cancelMovieCounter) {
        videoState.value = HomeState.done;
      }
      cancelMovieCounter = false;
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
      generateBackground(0);
      movies.add(
        Movie(
            id: 3,
            name: 'Jhon Wick',
            synopsis:
                'John Wick is a legendary retired hitman, dealing with grief after losing the great love of his life. When a gangster breaks into his house, kills his dog and steals his car, he is forced back into action and begins his revenge.',
            currentlyPlaying: true,
            streamLink:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
            genre: 'Action',
            poster: MoviePoster(
                name: 'poster',
                size: 12,
                url:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaYtD2JduoYuan9fiqgsicKrRWhZn9q_EbxtwI5G1BL7bHiz9KKiH7hFM&s=10"),
            endDate: DateTime.now()),
      );
      state.value = HomeState.done;
    } catch (e) {
      state.value = HomeState.error;
      rethrow;
    }
  }
}

enum HomeState { loading, done, error }
