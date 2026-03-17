import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    final cubit = sl<HabitsCubit>();
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
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
