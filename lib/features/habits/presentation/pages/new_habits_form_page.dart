import 'package:clean_arch_database/core/di/injector_container.dart';
import 'package:clean_arch_database/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter/material.dart';

class NewHabitsFormPage extends StatefulWidget {
  const NewHabitsFormPage({super.key});

  @override
  State<NewHabitsFormPage> createState() => _NewHabitsFormPageState();
}

class _NewHabitsFormPageState extends State<NewHabitsFormPage> {
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
    return Scaffold(
      appBar: AppBar(title: Text('Novo habito')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancelar'),
                  ),
                  ElevatedButton(onPressed: _submit, child: Text('Salvar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
