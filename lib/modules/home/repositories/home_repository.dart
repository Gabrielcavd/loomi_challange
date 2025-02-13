import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/data/http/api.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/http/reponse.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class HomeRepository {
  HomeRepository(this._baseHttpClient, this.firebaseAuthService);
  final BaseHttpClient _baseHttpClient;
  final FirebaseAuthService firebaseAuthService;

  Future<List<Movie>> getMovies() async {
    try {
      final AppResponse response = await _baseHttpClient.get(Api.movies);
      if (response.isError) {
        throw response.error!;
      }
      final movies = List.from(response.data["data"]["data"])
          .map((e) => Movie.fromJson(e))
          .toList();
      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
