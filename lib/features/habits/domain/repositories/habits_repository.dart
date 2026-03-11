import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';

abstract class HabitsRepository {
  Future<void> insert(HabitModel habit);

  Future<List<HabitModel>> get();

  Future<void> update(HabitModel habit);

  Future<void> delete(String id);
}
