import 'package:dio/dio.dart';
import 'package:news_app/core/constant/app_urls.dart';

class NewsService {
  late Dio _dio;
  NewsService() {
    _dio = Dio(BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    ));
  }

  Future<Map<String, dynamic>> fetchData(String endPoint) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }
}
