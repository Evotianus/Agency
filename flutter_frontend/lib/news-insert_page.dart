import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/news_page.dart';
import 'Classes/news.dart';
import 'Services/http_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/Widgets/TextAreaWidget.dart';

const List<String> list = <String>[
  'Education',
  'Time Management',
  'Self Improvement',
  'Entertainment',
  'Gaming'
];

class NewsInsertPage extends StatefulWidget {
  bool isLogin;
  String? loggedUserId;

  NewsInsertPage({
    super.key,
    required this.isLogin,
  });

  @override
  State<NewsInsertPage> createState() => _NewsInsertPageState();
}

class _NewsInsertPageState extends State<NewsInsertPage> {
  final _titleController = TextEditingController();

  final _contentController = TextEditingController();

  final _categoryController = TextEditingController();

  final _imageController = TextEditingController();

  final _authorController = TextEditingController();

  final _authorProfileController = TextEditingController();

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    String title;
    String content;
    String category;
    String image;
    String author;
    String authorProfile;

    return Scaffold(
      appBar: AppBar(
        title: Text("Insert News"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            runSpacing: 10,
            children: [
              InputBoxWidget(label: "Title", controller: _titleController),
              InputBoxWidget(label: "Content", controller: _contentController),
              // InputBoxWidget(
              //     label: "Category", controller: _categoryController),
              InputDecorator(
                decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      setState(() {
                        print(value);
                        dropdownValue = value!;
                      });
                    },
                    isExpanded: true,
                    value: dropdownValue,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              TextAreaWidget(label: "Image Url", controller: _imageController),
              InputBoxWidget(label: "Author", controller: _authorController),
              TextAreaWidget(
                  label: "Author Profile Url",
                  controller: _authorProfileController),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: ElevatedButton(
              // style: ButtonStyle(),
              onPressed: () {
                title = _titleController.text;
                content = _contentController.text;
                category = dropdownValue;
                image = _imageController.text;
                author = _authorController.text;
                authorProfile = _authorProfileController.text;

                News news = News(
                  title: title,
                  content: content,
                  category: category,
                  image: image,
                  author: author,
                  authorProfile: authorProfile,
                );

                print(jsonEncode(news));

                insertNews("/insert-news", news);

                Fluttertoast.showToast(
                  msg: "Successfully added news!",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.greenAccent,
                );

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NewsPage(
                        isLogin: widget.isLogin,
                        loggedUserId: widget.loggedUserId,
                      );
                    },
                  ),
                );
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
