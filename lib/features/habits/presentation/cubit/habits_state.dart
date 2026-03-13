import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';

abstract class HabitsState {
  const HabitsState();
}

class HabitsInitial extends HabitsState {}

class HabitsLoading extends HabitsState {}

class HabitsLoaded extends HabitsState {
  final List<HabitModel> habits;

  HabitsLoaded(this.habits);
}

class HabitsError extends HabitsState {
  final String error;

  HabitsError(this.error);
}
