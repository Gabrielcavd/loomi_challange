import 'package:get/get.dart';
import 'package:loomi_challange/modules/watch_movie/controllers/watch_movie_controller.dart';
import 'package:loomi_challange/modules/watch_movie/repositories/watch_movie_repository.dart';

class WatchMovieBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchMovieRepository>(
        () => WatchMovieRepository(Get.find(), Get.find()));
    Get.lazyPut<WatchMovieController>(() => WatchMovieController(
        Get.arguments, Get.find(), Get.find(), Get.find()));
  }
}
