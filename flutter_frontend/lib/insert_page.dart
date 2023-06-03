import 'dart:convert';
import 'package:flutter/material.dart';
import 'Widgets/InputBoxWidget.dart';
import 'users.dart';
import 'package:http/http.dart' as http;

String urlString = 'http://10.0.2.2:8000/api/api-test';

Future<Users> createUser(String jsonObj) async {
  final response = await http.post(
    Uri.parse(urlString),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode(jsonObj),
  );

  print("halo kawan");
  print(response.body);

  if (response.statusCode == 200) {
    print("Masuk bg");
    return Users.fromJson(jsonDecode(jsonObj));
  } else {
    print("Ga masuk");
    throw Exception("Failed to create User");
  }
}

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();

  String username = "", password = "", gender = "", age = "";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("API Request Test"),
            automaticallyImplyLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputBoxWidget(
                  label: "Username",
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                InputBoxWidget(
                  label: "Password",
                  controller: _passwordController,
                ),
                const SizedBox(height: 20),
                InputBoxWidget(
                  label: "Gender",
                  controller: _genderController,
                ),
                const SizedBox(height: 20),
                InputBoxWidget(
                  label: "Age",
                  controller: _ageController,
                ),
                const SizedBox(height: 50),
                Text("Username: $username"),
                Text("Password: $password"),
                Text("Gender: $gender"),
                Text("Age: $age"),
              ],
            ),
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('PROCEED'),
                  onPressed: () {
                    setState(() {
                      username = _usernameController.text;
                      password = _passwordController.text;
                      gender = _genderController.text;
                      age = _ageController.text;

                      Users userObj = Users(username, password, gender, age);

                      String userObja = jsonEncode(userObj);

                      createUser(userObja);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
