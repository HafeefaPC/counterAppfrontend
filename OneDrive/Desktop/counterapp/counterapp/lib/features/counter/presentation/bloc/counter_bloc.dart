import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import '../../domain/usecases/set_limit.dart' as usecase;
import '../../domain/usecases/get_limit.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {

  final usecase.SetLimit setLimit;
  final GetLimit getLimit;

  CounterBloc({required this.getLimit, required this.setLimit})
      : super(CounterInitial()) {
    on<Increment>((event, emit) {
      if (state.counterValue < state.limit) {
        emit(CounterLoaded(state.counterValue + 1, state.limit));
      }
    });
    on<Decrement>((event, emit) {
      if (state.counterValue > 0) {
        emit(CounterLoaded(state.counterValue - 1, state.limit));
      }
    });
    on<SetLimit>((event, emit) async {
      await setLimit(event.limit);
      emit(CounterLoaded(state.counterValue, event.limit));
    });
    on<LoadLimit>((event, emit) async {
      final limit = await getLimit();
      emit(CounterLoaded(state.counterValue, limit));
    });
  }
}
