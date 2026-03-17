import 'dart:async';

import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_state.dart';
import 'package:clean_arch_database/features/habits/presentation/widgets/list_habits_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  final habitsCubit = sl<HabitsCubit>();

  @override
  void initState() {
    super.initState();

    habitsCubit.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Habits")),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        bloc: habitsCubit,
        builder: (context, state) {
          if (state is HabitsLoading) {
            // return LoadingHabitsViewWidget();
          }
          if (state is HabitsLoaded) {
            if (state.habits.isEmpty) {
              // return EmptyHabitViewWidget();
            }
            return ListHabitsWidget(
              habits: state.habits,
              //  onDeleteCubit: () {
              //    habitsCubit.getHabits();
              //  },
            );
          }
          if (state is HabitsError) {
            //  return ErrorHabitsViewWidget(error: state.error);
          }
          return SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.push(AppRoutes.createHabit);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
