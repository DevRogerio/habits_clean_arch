import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';

class InsertHabitsUsecase {
  final HabitsRepository _repository;

  const InsertHabitsUsecase(this._repository);

  Future<void> call(HabitModel habit) async {
    await _repository.insert(habit);
  }
}
