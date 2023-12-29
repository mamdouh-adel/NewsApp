import 'package:dio/dio.dart';

class DioHelper {
  static late final Dio _dio;

  static void init() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/"
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> queries
}) async {
    return await _dio.get(
      url,
      queryParameters: queries
    );
  }
}