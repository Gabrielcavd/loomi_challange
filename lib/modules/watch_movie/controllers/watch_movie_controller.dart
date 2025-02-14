import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/data/domain/entities/subtitle.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';
import 'package:loomi_challange/core/data/services/internet_service.dart';
import 'package:loomi_challange/modules/watch_movie/domain/movie_options.dart';
import 'package:loomi_challange/modules/watch_movie/repositories/watch_movie_repository.dart';
import 'package:video_player/video_player.dart';

class WatchMovieController extends GetxController {
  WatchMovieController(this.movie, this.firebaseAuthService,
      this.watchMovieRepository, this.internetService);
  final Movie movie;
  final FirebaseAuthService firebaseAuthService;
  final WatchMovieRepository watchMovieRepository;
  final InternetService internetService;

  late final VideoPlayerController videoController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool videoIsLoading = true.obs;
  RxBool showInterface = false.obs;
  RxBool showSubtitles = false.obs;
  RxBool get internetOff => RxBool(internetService.internetOff);
  final movieIsPlaying = VideoStatus.neutral.obs;

  List<Subtitle> subtitles = [];

  List<MovieOption> audioOptions = [
    MovieOption(title: "English", isSelected: true),
    MovieOption(title: "Portuguese", isSelected: false),
    MovieOption(title: "Spanish", isSelected: false),
  ];

  List<MovieOption> subtitleOptions = [
    MovieOption(title: "Off", isSelected: true),
    MovieOption(title: "English (CC)", isSelected: false),
    MovieOption(title: "Spanish", isSelected: false),
    MovieOption(title: "Portuguese", isSelected: false),
  ];

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    setSubtitles();
    setVideoPlayer();
  }

  void setVideoPlayer() {
    videoController =
        VideoPlayerController.networkUrl(Uri.parse(movie.streamLink))
          ..initialize().then((_) {
            videoController.setVolume(1);
            videoController.play();
            videoController.setLooping(true);
            // videoController.setClosedCaptionFile(_loadCaptions());
            videoIsLoading.value = false;
            movieIsPlaying.value = VideoStatus.playing;
          });
  }

  Future<void> setSubtitles() async {
    try {
      final response = await watchMovieRepository.getSubtitles();
      subtitles.addAll(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents =
  //       await DefaultAssetBundle.of(Get.context!).loadString(subtitles[0].url);
  //   return WebVTTCaptionFile(fileContents);
  // }

  void changeAudio(int index) {
    audioOptions[index].isSelected = !audioOptions[index].isSelected;
  }

  void changeSubtitle(int index) {
    // selectedSubtitle.value = index;
  }

  void changeMovieStatus() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      movieIsPlaying.value = VideoStatus.paused;
    } else {
      videoController.play();
      movieIsPlaying.value = VideoStatus.playing;
      showInterface.value = false;
    }
  }

  void toggleInterface() {
    showInterface.value = !showInterface.value;
    Future.delayed(const Duration(seconds: 5), () {
      if (videoController.value.isPlaying) {
        showInterface.value = false;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    videoController.dispose();
  }
}

enum VideoStatus { playing, paused, neutral }
