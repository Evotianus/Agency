import 'package:flutter/material.dart';
import 'package:flutter_frontend/Classes/user.dart';
import 'package:flutter_frontend/Widgets/DrawerWidget.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/Widgets/TextAreaWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_frontend/home_page.dart';
import 'package:flutter_frontend/login_page.dart';
import 'Services/http_service.dart';

class RegisterPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  String? loggedUserId;

  RegisterPage({
    super.key,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;

    return Scaffold(
      drawer: DrawerWidget(
        isLogin: isLogin,
        loggedUserId: loggedUserId,
      ),
      appBar: AppBar(
        title: Text("Register Page"),
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
              InputBoxWidget(
                  label: "Phone Number", controller: _phoneNumberController),
              InputBoxWidget(label: "Email", controller: _emailController),
              TextAreaWidget(label: "Address", controller: _addressController),
              Wrap(
                children: [
                  Text("Already Have an Account?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginPage(
                              isLogin: isLogin,
                              loggedUserId: loggedUserId,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              String username = _usernameController.text;
              String password = _passwordController.text;
              String phoneNumber = _phoneNumberController.text;
              String email = _emailController.text;
              String address = _addressController.text;

              User user =
                  User(null, username, password, phoneNumber, email, address);

              registerUser("/register-user", user);

              Fluttertoast.showToast(
                msg: "Register Success!",
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.greenAccent,
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    isLogin = true;
                    loggedUserId = user.userId;
                    return LoginPage(
                      isLogin: isLogin,
                      loggedUserId: loggedUserId,
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Text(
                "Register",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
