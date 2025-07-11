import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { onChanged(!value); },
      child: Row(
        children: [
          Checkbox(value: value, onChanged: (bool? newValue) { onChanged(newValue!); }),
          Expanded(child: Text(label)),
        ]
      )
    );
  }
}