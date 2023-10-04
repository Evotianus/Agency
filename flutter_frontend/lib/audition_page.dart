import 'package:flutter/material.dart';
import 'package:flutter_frontend/Services/http_service.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/Widgets/TextAreaWidget.dart';

class AuditionPage extends StatelessWidget {
  bool isLogin;
  String? loggedUserId;

  final _usernameController = TextEditingController();
  final _interestController = TextEditingController();
  final _photoController = TextEditingController();
  final _descriptionController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 10,
              children: [
                Text(
                  "Audition Form",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                InputBoxWidget(
                    label: "Username", controller: _usernameController),
                InputBoxWidget(
                    label: "Interest", controller: _interestController),
                InputBoxWidget(
                    label: "Photo Link", controller: _photoController),
                TextAreaWidget(
                    label: "Describe Yourself",
                    controller: _descriptionController),
                ElevatedButton(
                    onPressed: () {
                      print("halo");
                      submitAudition(
                        '/insert-audition',
                        _usernameController.text,
                        _interestController.text,
                        _photoController.text,
                        _descriptionController.text,
                      );
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
