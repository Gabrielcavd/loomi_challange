import 'dart:async';
import 'dart:convert';
import 'package:loomi_challange/core/exceptions/exceptions.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/http/reponse.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements BaseHttpClient {
  final dio = Dio();

  @override
  Future<AppResponse> delete(String url,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final Response response;
    try {
      response = await dio.delete(url,
          queryParameters: query, options: Options(headers: headers));
      if (response.statusCode != 200) {
        return AppResponse(
            data: {},
            error: RequestException(response.statusMessage ?? "Unknown error"),
            statusCode: response.statusCode);
      }
      if (response.data == null) {
        return AppResponse(
            data: {},
            error: ResponseIsNullException(),
            statusCode: response.statusCode);
      }
      return AppResponse(
          data: _extactData(response.data), statusCode: response.statusCode);
    } on Exception catch (e) {
      return AppResponse(data: {}, error: RequestException(e.toString()));
    }
  }

  @override
  Future<AppResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final Response response;
    try {
      response = await dio.get(url,
          queryParameters: query, options: Options(headers: headers));
      if (response.statusCode != 200) {
        return AppResponse(
            data: {},
            error: RequestException(response.statusMessage ?? "Unknown error"),
            statusCode: response.statusCode);
      }
      if (response.data == null) {
        return AppResponse(
            data: {},
            error: ResponseIsNullException(),
            statusCode: response.statusCode);
      }
      return AppResponse(
          data: _extactData(response.data), statusCode: response.statusCode);
    } on Exception catch (e) {
      return AppResponse(data: {}, error: RequestException(e.toString()));
    }
  }

  @override
  Future<AppResponse> post(
    String url,
    body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final Response response;
    var data = json.encode(body);
    try {
      response = await dio.request(
        url,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode != 200) {
        return AppResponse(
            data: {},
            error: RequestException(response.statusMessage ?? "Unknown error"),
            statusCode: response.statusCode);
      }
      if (response.data == null) {
        return AppResponse(
            data: {},
            error: ResponseIsNullException(),
            statusCode: response.statusCode);
      }
      return AppResponse(
          data: response.data,
          headers: response.headers.map,
          statusCode: response.statusCode);
    } on Exception catch (e) {
      return AppResponse(data: {}, error: RequestException(e.toString()));
    }
  }

  @override
  Future<AppResponse> put(String url, body,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final Response response;
    try {
      response = await dio.put(url,
          data: body,
          queryParameters: query,
          options: Options(headers: headers));
      if (response.statusCode != 200) {
        return AppResponse(
            data: {},
            error: RequestException(response.statusMessage ?? "Unknown error"),
            statusCode: response.statusCode);
      }
      if (response.data == null) {
        return AppResponse(
            data: {},
            error: ResponseIsNullException(),
            statusCode: response.statusCode);
      }
      return AppResponse(
          data: _extactData(response.data), statusCode: response.statusCode);
    } on Exception catch (e) {
      return AppResponse(data: {}, error: RequestException(e.toString()));
    }
  }

  Map<String, dynamic> _extactData(dynamic data) {
    return {"data": data};
  }
}
