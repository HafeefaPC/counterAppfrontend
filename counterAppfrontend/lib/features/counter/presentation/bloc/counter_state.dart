
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int counterValue;
  final int limit;

  CounterInitial({this.counterValue = 0, this.limit = 10});
}

class CounterLoaded extends CounterState {
  final int counterValue;
  final int limit;

  CounterLoaded({required this.counterValue, required this.limit});
}

class CounterLoading extends CounterState {}

class CounterError extends CounterState {
  final String message;

  CounterError(this.message);
}


