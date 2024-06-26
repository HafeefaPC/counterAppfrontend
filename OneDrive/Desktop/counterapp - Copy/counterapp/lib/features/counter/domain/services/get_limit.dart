import 'package:dio/dio.dart';
import '../../data/models/limit_res_model.dart';

class GetLimit {
  final Dio _dio;
  final String baseUrl;

  GetLimit(this._dio, {required this.baseUrl}); // Constructor accepting Dio and required baseUrl

  Future<LimitResModel> call() async {
    try {
      final response = await _dio.get('$baseUrl/counter/');
      return LimitResModel.fromJson(response.data);
    } catch (e) {
      print("Error occurred while fetching limit: $e");
      throw Exception('Failed to fetch limit');
    }
  }
}