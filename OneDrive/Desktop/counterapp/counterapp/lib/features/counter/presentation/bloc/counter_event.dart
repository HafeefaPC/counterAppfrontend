import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class SetLimit extends CounterEvent {
  final int limit;

  SetLimit(this.limit);

  @override
  List<Object> get props => [limit];
}

class LoadLimit extends CounterEvent {}
