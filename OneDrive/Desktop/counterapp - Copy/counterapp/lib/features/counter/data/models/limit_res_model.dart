import 'package:equatable/equatable.dart';

class LimitResModel {
  final int limitValue;

  LimitResModel({required this.limitValue});

  factory LimitResModel.fromJson(Map<String, dynamic> json) {
    return LimitResModel(
      limitValue: json['limit_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit_value': limitValue,
    };
  }
}
