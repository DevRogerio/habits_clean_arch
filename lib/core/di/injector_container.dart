import 'package:clean_arch_database/features/habits/data/datasource/habits_local_datasource.dart';
import 'package:clean_arch_database/features/habits/data/datasource/habits_local_datasource_impl.dart';
import 'package:clean_arch_database/features/habits/data/repositories/habit_repository_impl.dart';
import 'package:clean_arch_database/features/habits/domain/repositories/habits_repository.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/delete_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/get_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/insert_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/domain/use_cases/update_habits_usecase.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/delete_habits_cubit.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<HabitsLocalDatasource>(
    () => HabitsLocalDatasourceImpl(),
  );
  sl.registerLazySingleton<HabitsRepository>(() => HabitRepositoryImpl(sl()));

  sl.registerLazySingleton(() => DeleteHabitsUsecase(sl()));
  sl.registerLazySingleton(() => GetHabitsUsecase(sl()));
  sl.registerLazySingleton(() => InsertHabitsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateHabitsUsecase(sl()));

  sl.registerLazySingleton(() => HabitsCubit(sl(), sl(), sl(), sl()));
}
