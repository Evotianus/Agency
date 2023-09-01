import 'package:flutter/material.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';

class AuditionPage extends StatelessWidget {
  bool isLogin;
  String? loggedUserId;

  final _usernameController = TextEditingController();
  final _interestController = TextEditingController();
  final _photoController = TextEditingController();

  AuditionPage({
    super.key,
    required this.isLogin,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    _usernameController.text = loggedUserId ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Audition Page Registration"),
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            "Audition Form",
            style: TextStyle(fontSize: 24),
          ),
          InputBoxWidget(label: "Username", controller: _usernameController),
          InputBoxWidget(label: "Interest", controller: _interestController),
          InputBoxWidget(label: "Photo Link", controller: _photoController),
        ],
      ),
    );
  }
}
