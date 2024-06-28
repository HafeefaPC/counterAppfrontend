class CounterModel {
  final int limitValue;

  CounterModel({required this.limitValue});

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      limitValue: json['limit_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit_value': limitValue,
    };
  }
}