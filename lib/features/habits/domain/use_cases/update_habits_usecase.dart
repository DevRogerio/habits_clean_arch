import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';

class UpdateHabitsUsecase {
  final HabitsRepository _repository;

  const UpdateHabitsUsecase(this._repository);

  Future<void> call(HabitModel habit) async {
    return await _repository.update(habit);
  }
}
