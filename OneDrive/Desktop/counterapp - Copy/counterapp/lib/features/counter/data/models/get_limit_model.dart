

class GetLimitModel {
  final int limitValue;

  GetLimitModel({required this.limitValue});

  factory GetLimitModel.fromJson(Map<String, dynamic> json) {
    return GetLimitModel(
      limitValue: json['limit_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit_value': limitValue,
    };
  }
}