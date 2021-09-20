import 'package:flutter/material.dart';
import 'package:todolistapp/widgets/input_form.dart';
import 'package:todolistapp/widgets/todo_widget.dart';
import 'models/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [];
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add(Todo(name: 'Comer'));
    todos.add(Todo(name: 'Morir'));
    todos.add(Todo(name: 'Dormir'));
  }

  void deleteTodo(Todo todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  void addTodo(String task) {
    setState(() {
      todos.add(Todo(name: task)); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('TODO APP'), backgroundColor: Colors.blue),
      body: Row(
        children: [
          //add todo
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoWidget(
                          key: UniqueKey(),
                          deleteHandler: deleteTodo,
                          todo: todos[index]);
                    }),
              ),
              Visibility(visible: isVisible, child: InputForm( onSubmitHandler: addTodo)),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
