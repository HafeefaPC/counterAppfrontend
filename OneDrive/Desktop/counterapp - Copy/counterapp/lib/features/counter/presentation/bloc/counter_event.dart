

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class FetchLimit extends CounterEvent {}

class UpdateLimit extends CounterEvent {
  final int newLimit;

  UpdateLimit(this.newLimit);
}