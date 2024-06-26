import 'package:dio/dio.dart';
import '../../data/models/limit_res_model.dart';
import '../../data/models/update_limit_model.dart';

class SetLimit {
  final Dio _dio;
  final String baseUrl;

  SetLimit(this._dio, {required this.baseUrl}); // Constructor accepting Dio and required baseUrl

  Future<LimitResModel> call(UpdateLimitModel updateLimitModel) async {
    try {
      final response = await _dio.put('$baseUrl/counter/', data: updateLimitModel.toJson());
      return LimitResModel.fromJson(response.data);
    } catch (e) {
      print("Error occurred while updating limit: $e");
      throw Exception('Failed to update limit');
    }
  }
}