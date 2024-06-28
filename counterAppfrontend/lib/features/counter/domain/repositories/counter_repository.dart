import 'package:counterapp/features/counter/data/models/get_limit_model.dart';
import 'package:dio/dio.dart';

import '../../data/models/limit_res_model.dart';
import '../../data/models/update_limit_model.dart';



class CounterRepository {
  final Dio _dio = Dio();
  final String baseUrl = "http://127.0.0.1:8000"; // Adjust the IP address for your environment

  Future<GetLimitModel> fetchLimit() async {
    try {
      print("Sending GET request to: $baseUrl/counter/");
      final response = await _dio.get('$baseUrl/counter/');
      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        return GetLimitModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch limit');
      }
    } catch (e) {
      print("Error occurred while fetching limit: $e");
      throw Exception('Failed to fetch limit');
    }
  }

  Future<LimitResModel> setLimit(UpdateLimitModel updateLimitModel) async {
  try {
    print("Sending PUT request to: $baseUrl/counter/");
    final response = await _dio.put(
      '$baseUrl/counter/',
      data: {"limit_value": updateLimitModel.maxLimit}, // Ensure the correct JSON structure
    );
    print("Response Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    if (response.statusCode == 200) {
      return LimitResModel.fromJson(response.data);
    } else {
      throw Exception('Failed to update limit');
    }
  } catch (e) {
    print("Error occurred while updating limit: $e");
    throw Exception('Failed to update limit');
  }
}
}