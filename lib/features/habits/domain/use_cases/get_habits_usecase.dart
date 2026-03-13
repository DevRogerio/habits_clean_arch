import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';

class GetHabitsUsecase {
  final HabitsRepository _repository;

  const GetHabitsUsecase(this._repository);

  Future<List<HabitModel>> call() async {
    return await _repository.get();
  }
}
