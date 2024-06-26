import 'package:equatable/equatable.dart';

class UpdateLimitModel {
  final int maxLimit;

  UpdateLimitModel({required this.maxLimit});

  Map<String, dynamic> toJson() {
    return {
      'limit_value': maxLimit,
    };
  }
}
