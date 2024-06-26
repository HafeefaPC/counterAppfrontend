import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      final currentstateValue = state.count;
      
      final newstateValue = currentstateValue + 1;
     
      return emit(CounterState(count: newstateValue));
    });
    on<Decrement>((event, emit) {
      final currentstateValue = state.count;
      final newstateValue = currentstateValue - 1;
      
      return emit(CounterState(count: newstateValue));
    });
  }
}
