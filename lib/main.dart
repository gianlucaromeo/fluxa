import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluxa/resizable_panel.dart';
import 'package:fluxa/ui.dart';

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:fluxa/interpreter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Interpreter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: JsonInterpreter.loadJsonFromFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: Text('No data available'),
            ),
          );
        }

        return Scaffold(
          body: Container(
            width: 300,
            height: 500,
            // simulate iphone design
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: JsonInterpreter.buildFromJson(snapshot.data!),
          ),
        );
      },
    );
  }
}
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resizable Container',
      home: ResizableContainerScreen(),
    );
  }
}

class ResizableContainerScreen extends StatefulWidget {
  @override
  _ResizableContainerScreenState createState() =>
      _ResizableContainerScreenState();
}

class _ResizableContainerScreenState extends State<ResizableContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('Resizable Container')),
        backgroundColor: AppColors.background,
        body: Row(
          children: [
            ResizablePanel(
              child: Column(
                children: List.generate(
                  50,
                  (index) => Container(
                    padding: const EdgeInsets.all(8.0),
                    color: AppColors.surface,
                    width: double.infinity,
                    child: Text(
                      '${Random().nextBool() ? "" : "  " * Random().nextInt(10)}Lorem ipsum ipsum lor $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */
