import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';

class DeleteHabitsUsecase {
  final HabitsRepository _repository;

  const DeleteHabitsUsecase(this._repository);

  Future<void> call(String id) async {
    return await _repository.delete(id);
  }
}
