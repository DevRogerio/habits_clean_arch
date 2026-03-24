import 'dart:math';

import 'package:clean_arch_database/features/habits/domain/use_cases/delete_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/delete_habits_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteHabitCubit extends Cubit<DeleteHabitsState> {
  final DeleteHabitsUsecase _deleteHabitsUsecase;
  DeleteHabitCubit(this._deleteHabitsUsecase)
    : super(DeleteHabitsStateInitial());

  Future<void> deleteHabit(String id) async {
    emit(DeletetingHabitsState(id));
    try {
      await Future.delayed(Duration(seconds: 2));
      await _deleteHabitsUsecase(id);
      emit(SuccessDeleteHabitsState());
    } catch (e) {
      emit(ErrorDeleteHabitsState(e.toString()));
    }
  }
}
