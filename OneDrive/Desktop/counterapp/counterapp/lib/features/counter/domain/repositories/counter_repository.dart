import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CounterRepository {
  final Dio _dio = Dio();
  final String baseUrl = "http://127.0.0.1:8000";

  Future<int> fetchLimit() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/counter/'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['limit_value'];
      } else {
        throw Exception('Failed to fetch limit');
      }
    } catch (e) {
      print('Error fetching limit: $e');
      throw Exception('Failed to fetch limit');
    }
  }

  Future<void> setLimit(int newLimit) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/counter/'),
        body: jsonEncode({'limit_value': newLimit}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update limit');
      }
    } catch (e) {
      print('Error updating limit: $e');
      throw Exception('Failed to update limit');
    }
  }
}
