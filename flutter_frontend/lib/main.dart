import 'package:flutter/material.dart';
import 'package:flutter_frontend/users.dart';
import 'Widgets/InputBoxWidget.dart';
import 'dart:convert';
import 'home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();

  String username = "", password = "", gender = "", age = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.transparent,
          ),
    );
  }
}
