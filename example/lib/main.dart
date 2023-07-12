import 'package:flutter/material.dart';
import 'package:onoffplugin/onoffplugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _onoffpluginPlugin = Onoffplugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _onoffpluginPlugin.pulseWidget,
      ),
    );
  }
}
