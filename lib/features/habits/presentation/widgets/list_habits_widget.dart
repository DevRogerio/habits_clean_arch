import 'package:clean_arch_database/features/habits/data/models/habit_model.dart';
import 'package:clean_arch_database/features/habits/presentation/widgets/habits_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListHabitsWidget extends StatelessWidget {
  final List<HabitModel> habits;
  const ListHabitsWidget({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return HabitCard(habit: habit);
      },
    );
  }
}
