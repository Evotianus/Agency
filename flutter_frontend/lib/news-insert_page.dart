import 'package:flutter/material.dart';

class NewsInsertPage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _categoryController = TextEditingController();
  final _imageController = TextEditingController();
  final _authorController = TextEditingController();
  final _authorProfileController = TextEditingController();

  NewsInsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert News"),
      ),
      body: Column(),
    );
  }
}
