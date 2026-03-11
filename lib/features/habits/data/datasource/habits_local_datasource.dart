import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';

abstract class HabitsLocalDatasource {
  Future<void> insertHabit(HabitModel habit);

  Future<List<HabitModel>> getHabits();

  Future<void> updateHabit(HabitModel habit);

  Future<void> deleteHabit(String id);
}
