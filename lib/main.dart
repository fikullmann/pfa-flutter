import 'package:flutter/material.dart';
import 'package:pfa/Drawer.dart';
import 'package:pfa/TodoWidget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const MyHomePage(title: 'Pomfight Adventure'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: drawer,
      body: Center(
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
