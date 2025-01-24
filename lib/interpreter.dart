// lib/interpreter/json_interpreter.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;

class JsonInterpreter {
  static Future<Map<String, dynamic>> loadJsonFromFile() async {
    return Future.value({
      "pages": {
        "page 1": {
          "scaffold": {
            "appBar": {
              "title": "Sample Page"
            },
            "body": {
              "column": {
                "children": [
                  {
                    "text": {
                      "data": "Welcome to the Sample Page (h1)",
                      "style": "h1"
                    }
                  },
                  {
                    "text": {
                      "data": "This is a sample text widget (body small).",
                      "style": "body small"
                    }
                  },
                  {
                    "button": {
                      "text": "Click Me",
                      "onPressed": {
                        "action": {
                          "type": "print",
                          "data": {
                            "message": "Button Clicked"
                          }
                        }
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      }
    });
  }

  static Widget buildFromJson(Map<String, dynamic> jsonData) {
    if (jsonData.containsKey('pages')) {
      // For now, we'll just take the first page
      final firstPageKey = jsonData['pages'].keys.first;
      return _buildPage(jsonData['pages'][firstPageKey]);
    }
    return Container();
  }

  static Widget _buildPage(Map<String, dynamic> pageData) {
    if (pageData.containsKey('scaffold')) {
      return _buildScaffold(pageData['scaffold']);
    }
    return Container();
  }

  static Widget _buildScaffold(Map<String, dynamic> scaffoldData) {
    return Scaffold(
      appBar: scaffoldData.containsKey('appBar')
          ? _buildAppBar(scaffoldData['appBar'])
          : null,
      body: scaffoldData.containsKey('body')
          ? _buildWidget(scaffoldData['body'])
          : null,
    );
  }

  static PreferredSizeWidget _buildAppBar(Map<String, dynamic> appBarData) {
    return AppBar(
      title: Text(appBarData['title'] ?? ''),
    );
  }

  static Widget _buildWidget(Map<String, dynamic> widgetData) {
    if (widgetData.containsKey('column')) {
      return _buildColumn(widgetData['column']);
    } else if (widgetData.containsKey('text')) {
      return _buildText(widgetData['text']);
    } else if (widgetData.containsKey('button')) {
      return _buildButton(widgetData['button']);
    }
    return Container();
  }

  static Widget _buildColumn(Map<String, dynamic> columnData) {
    final children = columnData['children'] as List;
    return Column(
      children: children.map((child) => _buildWidget(child)).toList(),
    );
  }

  static Widget _buildText(Map<String, dynamic> textData) {
    return Text(
      textData['data'] ?? '',
      style: _getTextStyle(textData['style']),
    );
  }

  static Widget _buildButton(Map<String, dynamic> buttonData) {
    return ElevatedButton(
      onPressed: () => _handleAction(buttonData['onPressed']['action']),
      child: Text(buttonData['text'] ?? ''),
    );
  }

  static TextStyle? _getTextStyle(String? style) {
    switch (style) {
      case 'h1':
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );
      case 'body small':
        return const TextStyle(
          fontSize: 14,
        );
      default:
        return null;
    }
  }

  static void _handleAction(Map<String, dynamic> action) {
    switch (action['type']) {
      case 'print':
        print(action['data']['message']);
        break;
    // Add more action types here as needed
    }
  }
}