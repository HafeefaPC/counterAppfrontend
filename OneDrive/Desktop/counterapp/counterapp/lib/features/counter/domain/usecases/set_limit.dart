import '../repositories/counter_repository.dart';

class SetLimit {
  final CounterRepository repository;

  SetLimit(this.repository);

  Future<void> call(int limit) {
    return repository.setLimit(limit);
  }
}
