import 'package:loomi_challange/core/data/domain/entities/subtitle.dart';
import 'package:loomi_challange/core/data/http/api.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/http/reponse.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class WatchMovieRepository {
  WatchMovieRepository(this.firebaseAuthService, this._baseHttpClient);
  FirebaseAuthService firebaseAuthService;
  BaseHttpClient _baseHttpClient;

  Future<List<Subtitle>> getSubtitles() async {
    try {
      String? token = await firebaseAuthService.getAuthToken();
      // String? uid = await firebaseAuthService.getFirebaseUID();
      final AppResponse response = await _baseHttpClient.get(
        Api.subtitles,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.isError) {
        throw response.error!;
      }
      final subtitles = List.from(response.data["data"]["data"])
          .map((e) => Subtitle.fromMap(e))
          .toList();
      return subtitles;
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> getLikes() async {
  //   String? token = await firebaseAuthService.getAuthToken();
  //   String? uid = await firebaseAuthService.getFirebaseUID();
  //   final body = {
  //     "movie_id": 1,
  //     "user_id": uid,
  //   };
  //   final AppResponse response = await _baseHttpClient.get(
  //     Api.likes,
  //     headers: {
  //       "Authorization": "Bearer $token",
  //     },
  //   );
  // }
}
