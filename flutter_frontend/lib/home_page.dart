import 'package:flutter/material.dart';
import 'package:flutter_frontend/Classes/event.dart';
import 'package:flutter_frontend/Widgets/EventCardWidget.dart';
import 'package:flutter_frontend/event-detail_page.dart';
import 'package:flutter_frontend/insert_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Widgets/DrawerWidget.dart';
import 'Services/http_service.dart';
import 'Classes/event.dart';

class HomePage extends StatelessWidget {
  bool isLogin;
  String? loggedUserId;

  HomePage({
    super.key,
    required this.isLogin,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: DrawerWidget(
        isLogin: isLogin,
        loggedUserId: loggedUserId,
      ),
      appBar: AppBar(
        title: const Text("Event Lists"),
      ),
      body: FutureBuilder(
        future: getEvent("/get-event"),
        builder: (BuildContext, AsyncSnapshot<List<Event>?> snapshot) {
          List<Event>? newsList = snapshot.data;
          if (newsList != null) {
            print(loggedUserId);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                runSpacing: 10,
                children: newsList.map((Event event) {
                  return EventCardWidget(
                    eventId: event.eventId!,
                    title: event.title!,
                    eventDate: event.eventDate!,
                    price: event.price!,
                    ticketCount: event.ticketCount!,
                    image: event.image!,
                    loggedUserId: loggedUserId,
                  );
                }).toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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
