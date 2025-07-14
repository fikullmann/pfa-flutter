import 'package:flutter/material.dart';

import 'TodoWidget.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoState();

}

class _TodoState extends State<TodoView> {
  List<String> todoStrings = [];
  final List<bool> _isSelected = [];
  final todoInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    todoInputController.dispose();
    super.dispose();
  }

  void createTodo(String input) {
    if (input.isNotEmpty) {
      setState(() {
        todoStrings.add(input);
      });
    }
  }

  List<Widget> createTodoWidgets() {
    List<Widget> testTodo = [];
    for (var (i, todoString) in todoStrings.indexed) {
      if (i >= _isSelected.length) {
        _isSelected.add(false);
      }
      testTodo.add(TodoWidget(label: todoString, value: _isSelected[i], onChanged: (bool newValue) {
        setState(() {
          _isSelected[i] = newValue;
        });
      }));
    }
    return testTodo;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Todo',
              ),
              controller: todoInputController,
              onFieldSubmitted: (String input) { createTodo(input); todoInputController.clear(); },
            ),
          ),
        ] + createTodoWidgets(),
      )
    );
  }

}