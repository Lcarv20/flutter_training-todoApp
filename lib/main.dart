import 'package:flutter/material.dart';

void main() => runApp(const ProviderApp());

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Provider Training App",
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo with Provider 6.0"),
      ),
      body: const Center(
        child: Text("Hello TodoApp"),
      ),
    );
  }
}
