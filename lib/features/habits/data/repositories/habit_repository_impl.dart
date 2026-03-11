import 'package:clean_arch_database/features/habits/data/datasource/habits_local_datasource.dart';
import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';

class HabitRepositoryImpl implements HabitsRepository {
  final HabitsLocalDatasource _localDatasource;

  HabitRepositoryImpl(this._localDatasource);

  Future<void> delete(String id) async {
    await _localDatasource.deleteHabit(id);
  }

  @override
  Future<List<HabitModel>> get() async {
    final models = await _localDatasource.getHabits();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> insert(HabitModel habit) async {
    await _localDatasource.insertHabit(HabitModel.fromEntity(habit));
  }

  @override
  Future<void> update(HabitModel habit) async {
    await _localDatasource.updateHabit(HabitModel.fromEntity(habit));
  }
}
