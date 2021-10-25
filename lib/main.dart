import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_training/body.dart';
import 'package:provider_training/past_todos.dart';
import 'package:provider_training/todo_controller.dart';

void main() => runApp(const ProviderApp());

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Training App",
      home: HomeApp(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple[700],
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  HomeApp({Key? key}) : super(key: key);
  final todosController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Todo with Provider 6.0"),
      ),
      body: Body(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text(
                "Completed todos",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PastTodos(
                      listedTodos: todosController.todones,
                      listIdentifier: "completed",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                "Deleted todos",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PastTodos(
                      listedTodos: todosController.toNotdones,
                      listIdentifier: "deleted",
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
