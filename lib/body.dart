import "package:flutter/material.dart";
import 'package:provider_training/todo_controller.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final todosController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final todos = todosController.todos;

    return Column(
      children: [
        const AddTodo(),
        Expanded(
          flex: 1,
          child: GetBuilder<TodoController>(builder: (
            context,
          ) {
            return todos.isNotEmpty
                ? ListView.separated(
                    // padding: const EdgeInsets.all(5.0),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                          key: UniqueKey(),
                        ),
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleTodo(
                        todo: todos[index],
                        todoIdx: index,
                      );
                    })
                : const Center(
                    child: Text("You have no todos"),
                  );
          }),
        ),
      ],
    );
  }
}

class SingleTodo extends StatefulWidget {
  const SingleTodo({
    Key? key,
    required this.todo,
    required this.todoIdx,
  }) : super(key: key);

  final String todo;
  final int todoIdx;

  @override
  State<SingleTodo> createState() => _SingleTodoState();
}

class _SingleTodoState extends State<SingleTodo> {
  final todosController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: Icon(
          Icons.delete,
          color: Colors.blueGrey.shade50,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.check,
          color: Colors.blueGrey.shade50,
        ),
      ),
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        // Complete todo
        if (direction == DismissDirection.endToStart) {
          todosController.completeTodo(widget.todoIdx);
          return;
        }
        todosController.deleteTodo(widget.todoIdx);
      },
      child: ListTile(
        tileColor: Colors.blueGrey[50],
        leading: const Icon(Icons.more_vert),
        contentPadding: const EdgeInsets.all(12.0),
        title: Text(
          widget.todo,
          // textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0),
        ),

        // Todo Text
      ),
    );
  }
}

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todosController = Get.put(TodoController());
  final _todoInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  InputDecoration _textFieldDecoration(context) => InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        labelText: "New todo",
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      );

  String? _inputValidator(String? input) {
    if (input == null || input.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              controller: _todoInputController,
              validator: _inputValidator,
              decoration: _textFieldDecoration(context),
              cursorColor: Theme.of(context).primaryColor,
              onFieldSubmitted: (String newTodo) {
                if (_formKey.currentState!.validate()) {
                  todosController.addTodo(newTodo);
                  _todoInputController.text = "";
                }
              },
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
