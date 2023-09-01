import 'package:flutter/material.dart';
import 'package:flutter_frontend/users.dart';
import 'Widgets/InputBoxWidget.dart';
import 'dart:convert';
import 'home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  bool isLogin = false;
  String? loggedUser;
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
      home: HomePage(
        isLogin: widget.isLogin,
        loggedUserId: widget.loggedUser,
      ),
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.transparent,
          ),
    );
  }
}
