import 'package:loomi_challange/core/exceptions/exceptions.dart';

class AppResponse {
  final Map<String, dynamic> data;
  final Failure? error;
  final int? statusCode;
  final Map<String, dynamic>? headers;
  const AppResponse(
      {required this.data, this.statusCode, this.error, this.headers});

  bool get isError => error != null;
}
