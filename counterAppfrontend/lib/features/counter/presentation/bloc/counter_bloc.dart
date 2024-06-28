import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/update_limit_model.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import '../../domain/services/set_limit.dart';
import '../../domain/services/get_limit.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final SetLimit setLimit;
  final GetLimit getLimit;

  CounterBloc({required this.getLimit, required this.setLimit})
      : super(CounterInitial(counterValue: 0, limit: 10)) {
    
    // Handle Increment
    on<Increment>((event, emit) {
      if (state is CounterLoaded) {
        final currentState = state as CounterLoaded;
        if (currentState.counterValue < currentState.limit) {
          emit(CounterLoaded(
              counterValue: currentState.counterValue + 1,
              limit: currentState.limit));
        }
      }
    });

    // Handle Decrement
    on<Decrement>((event, emit) {
      if (state is CounterLoaded) {
        final currentState = state as CounterLoaded;
        if (currentState.counterValue > 0) {
          emit(CounterLoaded(
              counterValue: currentState.counterValue - 1,
              limit: currentState.limit));
        }
      }
    });

    // Handle FetchLimit
    on<FetchLimit>((event, emit) async {
      emit(CounterLoading());
      try {
        final limitModel = await getLimit(); // Call the getLimit use case
        emit(CounterLoaded(counterValue: 0, limit: limitModel.limitValue));
      } catch (e) {
        emit(CounterError("Failed to fetch limit: $e"));
        print("Error fetching limit: $e");
      }
    });

    // Handle UpdateLimit
    on<UpdateLimit>((event, emit) async {
  if (state is CounterLoaded) {
    final currentState = state as CounterLoaded;
    emit(CounterLoading());
    try {
      // Assuming setLimit returns a limit model after updating
      final limitModel = await setLimit(UpdateLimitModel(maxLimit: event.newLimit));
      emit(CounterLoaded(
        counterValue: currentState.counterValue,
        limit: limitModel.limitValue,
      ));
    } catch (e) {
      emit(CounterError("Failed to update limit: $e"));
      print("Error updating limit: $e");
    }
  }
});
  }
}