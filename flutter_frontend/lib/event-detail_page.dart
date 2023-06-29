import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  String title;

  EventDetailPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
