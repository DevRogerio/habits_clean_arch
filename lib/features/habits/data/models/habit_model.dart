import 'package:clean_arch_database/core/database/tables/habits_table.dart';

class HabitModel {
  final String id;
  final String name;
  final String title;
  final DateTime createdAt;

  HabitModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.title,
  });

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map[habitstableId],
      name: map[habitstableName],
      title: map[habitstableTitle],
      createdAt: DateTime.parse(map[habitstableCreatedAt]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      habitstableId: id,
      habitstableName: name,
      habitstableTitle: title,
      habitstableCreatedAt: createdAt.toIso8601String(),
    };
  }

  HabitModel toEntity() {
    return HabitModel(id: id, name: name, title: title, createdAt: createdAt);
  }

  factory HabitModel.fromEntity(HabitModel entity) {
    return HabitModel(
      id: entity.id,
      name: entity.name,
      title: entity.title,
      createdAt: entity.createdAt,
    );
  }
}
