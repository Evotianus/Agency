import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  String eventId;
  String title;

  EventDetailPage({
    super.key,
    required this.eventId,
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
