import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter/material.dart';

class HabitsFormDialog extends StatefulWidget {
  const HabitsFormDialog({super.key});

  @override
  State<HabitsFormDialog> createState() => _HabitsFormDialogState();
}

class _HabitsFormDialogState extends State<HabitsFormDialog> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final habitsCubit = sl<HabitsCubit>();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final title = _controller.text.trim();
    await habitsCubit.insertHabit(title);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Novo Habito'),
      key: _formKey,
      content: Form(
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Nome do habito',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          },
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Salvar')),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
