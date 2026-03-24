import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyHabitViewWidget extends StatelessWidget {
  const EmptyHabitViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.circle_outlined, size: 80, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Nenhum hábito encontrado',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Crie seu primeiro hábito'),
        ],
      ),
    );
  }
}
