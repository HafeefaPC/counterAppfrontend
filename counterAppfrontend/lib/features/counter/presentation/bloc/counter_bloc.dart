import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import '../../domain/repositories/counter_repository.dart';
import '../../data/models/update_limit_model.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  CounterBloc({required this.counterRepository})
      : super(CounterInitial(counterValue: 0, limit: 10)) {

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

    on<FetchLimit>((event, emit) async {
      emit(CounterLoading());
      try {
        final limitModel = await counterRepository.fetchLimit();
        emit(CounterLoaded(counterValue: 0, limit: limitModel.limitValue));
      } catch (e) {
        emit(CounterError("Failed to fetch limit: $e"));
        print("Error fetching limit: $e");
      }
    });

    on<UpdateLimit>((event, emit) async {
      if (state is CounterLoaded) {
        final currentState = state as CounterLoaded;
        emit(CounterLoading());
        try {
          final limitModel = await counterRepository.setLimit(UpdateLimitModel(maxLimit: event.newLimit));
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
