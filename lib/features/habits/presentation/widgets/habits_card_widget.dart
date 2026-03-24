import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/delete_habits_cubit.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/delete_habits_state.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitCard extends StatelessWidget {
  final void Function() onDeleteCubit;
  const HabitCard({
    super.key,
    required this.habit,
    required this.onDeleteCubit,
  });

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    final cubit = DeleteHabitCubit(sl());
    return Card(
      child: ListTile(
        title: Text(habit.title),
        trailing: Column(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () async {
                await cubit.deleteHabit(habit.id);
              },
              icon: BlocConsumer<DeleteHabitCubit, DeleteHabitsState>(
                listener: (context, state) {
                  if (state is SuccessDeleteHabitsState) {
                    onDeleteCubit();
                  }
                  if (state is ErrorDeleteHabitsState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('erro ao deletar habito: ${state.error}'),
                      ),
                    );
                  }
                },
                bloc: cubit,
                builder: (context, state) {
                  if (state is DeletetingHabitsState &&
                      state.deleteingId == habit.id) {
                    return CircularProgressIndicator();
                  }
                  return Icon(Icons.delete);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
