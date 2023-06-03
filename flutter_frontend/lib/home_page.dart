import 'package:flutter/material.dart';
import 'package:flutter_frontend/insert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Lists"),
      ),
      body: Text("Halo"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const InsertPage();
              },
            ),
          );
        },
        // child: Icon(Icons.add),
      ),
    );
  }
}
