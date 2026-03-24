abstract class DeleteHabitsState {}

class DeleteHabitsStateInitial implements DeleteHabitsState {}

class DeletetingHabitsState implements DeleteHabitsState {
  final String deleteingId;

  DeletetingHabitsState(this.deleteingId);
}

class SuccessDeleteHabitsState implements DeleteHabitsState {}

class ErrorDeleteHabitsState implements DeleteHabitsState {
  final String error;

  ErrorDeleteHabitsState(this.error);
}
