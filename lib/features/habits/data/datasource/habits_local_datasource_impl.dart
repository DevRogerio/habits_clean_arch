import 'package:clean_arch_database/core/database/app_database.dart';
import 'package:clean_arch_database/core/database/tables/habits_table.dart';
import 'package:clean_arch_database/features/habits/data/datasource/habits_local_datasource.dart';
import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class HabitsLocalDatasourceImpl implements HabitsLocalDatasource {
  Future<Database> get _db async => await AppDatabase.instance;

  @override
  Future<void> deleteHabit(Pattern id) async {
    final db = await _db;

    await db.delete(habitstableName, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await _db;
    final habitsMap = await db.query(habitstableName);

    return habitsMap.map(HabitModel.fromMap).toList();
  }

  @override
  Future<void> insertHabit(HabitModel habit) async {
    final db = await _db;

    await db.insert(
      habitstableName,
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final db = await _db;
    await db.update(
      habitstableName,
      habit.toMap(),
      where: "id = ?",
      whereArgs: [habit.id],
    );
  }
}
