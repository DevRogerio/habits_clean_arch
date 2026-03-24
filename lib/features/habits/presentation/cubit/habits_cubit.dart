import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/delete_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/get_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/insert_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/update_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class HabitsCubit extends Cubit<HabitsState> {
  final GetHabitsUsecase _getHabitsUsecase;
  final InsertHabitsUsecase _insertHabitUsecase;
  final UpdateHabitsUsecase _updateHabitsUsecase;
  final DeleteHabitsUsecase _deleteHabitsUsecase;

  HabitsCubit(
    this._deleteHabitsUsecase,
    this._updateHabitsUsecase,
    this._getHabitsUsecase,
    this._insertHabitUsecase,
  ) : super(HabitsInitial());

  Future<void> getHabits() async {
    emit(HabitsLoading());
    try {
      final habits = await _getHabitsUsecase();
      emit(HabitsLoaded(habits));
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }

  Future<void> insertHabit(String title) async {
    try {
      final habit = HabitModel(
        id: Uuid().v4(),
        title: title,
        createdAt: DateTime.now(),
      );
      await _insertHabitUsecase(habit);
      getHabits();
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }

  Future<void> updateHabit(HabitModel habit) async {
    try {
      await _updateHabitsUsecase(habit);
      getHabits();
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }
}
