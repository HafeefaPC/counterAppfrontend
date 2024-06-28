import '../repositories/counter_repository.dart';

class GetLimit {
  final CounterRepository repository;

  GetLimit(this.repository);

  Future<int> call() {
    return repository.fetchLimit();
  }
}
