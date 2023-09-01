import 'package:flutter/material.dart';
import 'package:flutter_frontend/Classes/user.dart';
import 'package:flutter_frontend/Widgets/DrawerWidget.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/home_page.dart';
import 'package:flutter_frontend/main.dart';
import 'package:flutter_frontend/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Services/http_service.dart';

class LoginPage extends StatelessWidget {
  bool isLogin;
  String? loggedUserId;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({
    super.key,
    required this.isLogin,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      drawer: DrawerWidget(
        isLogin: isLogin,
        loggedUserId: loggedUserId,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              Text(
                "Let's Sign You In!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              InputBoxWidget(
                  label: "Username", controller: _usernameController),
              InputBoxWidget(
                  label: "Password", controller: _passwordController),
              Wrap(
                children: [
                  Text("Don't Have an Account Yet?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegisterPage(
                              loggedUserId: loggedUserId,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              String username = _usernameController.text;
              String password = _passwordController.text;

              User? user = await loginUser("/login-user", username, password);

              if (user?.username == null) {
                print("kosong bg");
                return;
              }

              // MyApp.loggedUser = user?.userId;
              print("Ada isi bg");

              // user.then((value) {
              //   print(value!);
              //   // userId = value!.userId;
              //   // if (value!.isEmpty) {
              //   //   print("user is empty");
              //   // }
              //   // print("no its not");
              // });

              // user.then((value) {
              //   MyApp.loggedUser = value!.userId;
              // });

              Fluttertoast.showToast(
                msg: "Login Successfully!",
                backgroundColor: Colors.greenAccent,
                toastLength: Toast.LENGTH_SHORT,
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    isLogin = true;
                    return HomePage(
                      isLogin: isLogin,
                      loggedUserId: user?.userId,
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
