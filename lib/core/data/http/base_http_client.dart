import 'package:loomi_challange/core/data/http/reponse.dart';

abstract class BaseHttpClient {
  Future<AppResponse> post(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
  Future<AppResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
  Future<AppResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
  Future<AppResponse> put(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
