import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  final int limit;

  const CounterState({required this.counterValue, required this.limit});

  @override
  List<Object> get props => [counterValue, limit];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0, limit: 10);
}

class CounterLoaded extends CounterState {
  CounterLoaded(int counterValue, int limit) : super(counterValue: counterValue, limit: limit);
}
