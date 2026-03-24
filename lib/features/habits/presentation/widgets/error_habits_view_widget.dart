import 'package:flutter/widgets.dart';

class ErrorHabitsViewWidget extends StatelessWidget {
  const ErrorHabitsViewWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
