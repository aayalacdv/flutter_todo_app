import 'package:flutter/material.dart';
import 'package:todolistapp/models/todo_model.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  final Function(Todo todo) deleteHandler;
  const TodoWidget({Key? key, required this.todo, required this.deleteHandler})
      : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Checkbox(
              value: widget.todo.isDone,
              onChanged: (value) => {
                    setState(() {
                      widget.todo.isDone = !widget.todo.isDone;
                    })
                  }),
          Text(widget.todo.name),
          IconButton(
              onPressed: () {
                widget.deleteHandler(widget.todo); 
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
