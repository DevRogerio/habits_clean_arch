import 'package:clean_arch_database/core/routes/routes.dart';
import 'package:clean_arch_database/features/habits/presentation/pages/home_page.dart';
import 'package:clean_arch_database/features/habits/presentation/pages/new_habits_form_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.habits,
  routes: [
    GoRoute(path: AppRoutes.habits, builder: (context, state) => HabitsPage()),
    GoRoute(
      path: AppRoutes.createHabit,
      builder: (context, state) => NewHabitsFormPage(),
    ),
  ],
);
