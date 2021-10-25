import 'package:flutter/material.dart';

class PastTodos extends StatelessWidget {
  const PastTodos(
      {Key? key, required this.listedTodos, required this.listIdentifier})
      : super(key: key);

  final List listedTodos;
  final String listIdentifier;

  @override
  Widget build(BuildContext context) {
    var orderedTodos = listedTodos.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: (orderedTodos.isEmpty)
          ? Center(
              child: Text("You have no $listIdentifier todos"),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                    key: UniqueKey(),
                  ),
              itemCount: orderedTodos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(orderedTodos[index]),
                  contentPadding: const EdgeInsets.all(12.0),
                  tileColor: Colors.blueGrey[50],
                );
              }),
    );
  }
}
